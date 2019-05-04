#!/usr/bin/env python

import csv
import os
import sys
import re

CATEGORY_CODE = {
  'SYSTEM': 0,
  'ALU': 1,
  'LOAD_STORE': 2,
  'PERIPHERAL': 3,
  'JUMP': 4
}

validRegisters = set()

for i in xrange(0, 15):
  validRegisters.add('R' + str(i))

def userAssert(condition, message):
  if not condition:
    print message
    exit(1)

def lineAssert(condition, num, rawLine, message):
  if not condition:
    print message
    print ''
    print 'Line', str(num) + ':'
    print rawLine
    exit(1)

def todo(message = 'something'):
  print "Incomplete TODO:", message

def assemblerAssert(condition, message):
  if not condition:
    print message
    print ''
    print '(This is a compiler-level error indicating an assembler programmer mistake not an assembler user mistake)'
    exit(1)

myDir = os.path.dirname(__file__)
opsPath = os.path.join(myDir, 'ops.csv')

assemblerAssert(os.path.isfile(opsPath), 'Expected an ops file at ' + os.path.abspath(opsPath))

userAssert(len(sys.argv) == 3, 'Usage: python assembler.py <input assembly> <output binary>')
userAssert(os.path.isfile(sys.argv[1]), 'Expected the path to an assembly file as the first argument')
asmPath = sys.argv[1]

with open(opsPath) as csvfile:
  ops = list(csv.DictReader(csvfile))

opByCode = {}

# For testing that a code is not repeated within a category
codePerCategory = {
  'SYSTEM': [],
  'ALU': [],
  'LOAD_STORE': [],
  'PERIPHERAL': [],
  'JUMP': []
}

# Building structures and validation
for op in ops:
  assemblerAssert(op['Category'] in CATEGORY_CODE, 'Op ' + op['Opcode'] + ' has unrecognized category ' + op['Category'] + ' (it should be one of ' + ', '.join(list(CATEGORY_CODE)) + ')')

  assemblerAssert(op['Operation'] not in codePerCategory[op['Category']], 'The Operation ' + op['Operation'] + ' is repeated more than once for the category ' + op['Category'])

  codePerCategory[op['Category']].append(op['Operation'])

  operation = int(op['Operation'])

  op['Operation'] = operation

  assemblerAssert(0 <= operation and operation <= 63, 'Op ' + op['Opcode'] + ' must have an Operation between 0 and 63 inclusive')

  opcode = op['Opcode'].upper()

  assemblerAssert(opcode not in opByCode, 'Op ' + op['Opcode'] + ' is repeated')

  opByCode[opcode] = op

class SystemResolver:
  def __init__(self, operation):
    self.operation = operation

  def resolveHex(self, _):
    return hex(self.operation << 24)

class AluResolver:
  def __init__(self, operation, rOut, r1, r2):
    self.operation = operation
    self.rOut = rOut
    self.r1 = r1
    self.r2 = r2

  def resolveHex(self, _):
    return hex(CATEGORY_CODE['ALU'] << 29 | self.operation << 24 | self.rOut << 20 | self.r1 << 16 | self.r2 << 12)

class LoadStoreResolver:
  def __init__(self, operation, register, immediate):
    self.operation = operation
    self.register = register
    self.immediate = immediate

  def resolveHex(self, _):
    return hex(CATEGORY_CODE['LOAD_STORE'] << 29 | self.operation << 24 | self.register << 20 | self.immediate)

class PeripheralResolver:
  def __init__(self, operation, register):
    self.operation = operation
    self.register = register

  def resolveHex(self, _):
    return hex(CATEGORY_CODE['PERIPHERAL'] << 29 | self.operation << 24 | self.register << 20)

class JumpResolver:
  def __init__(self, operation, address, rawLine, lineNumber):
    self.operation = operation
    self.address = address
    self.rawLine = rawLine
    self.lineNumber = lineNumber

  def resolveHex(self, addresses):
    lineAssert(self.address in addresses, self.lineNumber, self.rawLine, self.address + ' is not a valid jump address')
    return hex(CATEGORY_CODE['PERIPHERAL'] << 29 | self.operation << 24 | addresses[address] << 12)

class ByteConstant:
  def __init__(self, byteLiterals):
    self.byteLiterals = byteLiterals + [0]*(4 - len(byteLiterals))

  def resolveHex(self):
    output = 0

    for byte in self.byteLiterals:
      output = output << 8
      output |= byte

    return [hex(output)]

class ShortConstant:
  def __init__(self, shortLiterals):
    self.shortLiterals = shortLiterals

  def resolveHex(self):
    return []

class StringConstant:
  def __init__(self, string):
    self.string = string

  def resolveHex(self):
    return []

output = []
addresses = {}
currentAddress = 0
constants = []
constantByAddress = {}

def isValidString(text):
  walker = text.strip()
  justEscaped = False

  if text == '':
    return True

  if walker[0] != '"':
    return False

  walker = walker[1:]

  while True:
    if len(walker) == 0:
      return False

    if walker[0] == '"':
      walker = walker[1:]
      break

    if walker[0:2] == '\\"':
      walker = walker[2:]
      continue

    walker = walker[1:]

  return walker.strip() == ''

def isValidAddress(token):
  return token.isalnum()

def isValidRegister(token):
  return token.upper() in validRegisters

def parseRegister(token):
  return int(token[1:])

def unsafeParseBinary(token):
  strippedOfBinary = token.replace("'", '').replace('B', '').replace('b', '')

  return int(strippedOfBinary, 2)

def parseImmediate(token):
  try:
    return int(token)
  except:
    try:
      return int(token, 0)
    except:
      return unsafeParseBinary(token)

def parseByte(token):
  return int(token, 0)

def parseShort(token):
  return int(token, 0)

def isValidByte(token):
  try:
    v = int(token, 0)
    return 0 <= v and v <= 255
  except:
    return False

def isValidShort(token):
  try:
    v = int(token, 0)
    return 0 <= v and v <= 65535
  except:
    return False

def isValidImmediateValue(token):
  valid = False

  try:
    v = int(token)
    valid = True
  except:
    try:
      v = int(token, 0)
      valid = True
    except:
      try:
        looksLikeBinary = token.startswith("b'") or token.startswith("B'")
        v = unsafeParseBinary(token)
        valid = looksLikeBinary
      except:
        pass

  return valid and -32768 <= v and v <= 32767

def stripComments(line):
  resultLine = ''
  inString = False
  justEscaped = False

  for c in line:
    if c == ';' and not inString:
      break
    elif c == '"' and not inString and not justEscaped:
      inString = True
    elif c == '"' and inString and not justEscaped:
      inString = False

    justEscaped = inString and c == '\\'

    resultLine += c

  return resultLine

# assert stripComments('') == ''
# assert stripComments('; foo') == ''
# assert stripComments('add r10,r11,r12; foo') == 'add r10,r11,r12'
# assert stripComments('hi: .string "foo bar" ; comment') == 'hi: .string "foo bar" '
# assert stripComments('hi: .string "foo; bar"') == 'hi: .string "foo; bar"'
# assert stripComments('hi: .string "foo; \\" ; bar"') == 'hi: .string "foo; \\" ; bar"'

# Parse and write output
with open(asmPath, 'r') as f:
  for num, rawLine in enumerate(f):

    line = stripComments(rawLine)

    # Ignore empty lines
    if line.strip() == '':
      continue

    tokens = re.split('[\s|,]+', line.strip())

    if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.STRING':
      address = tokens[0][:-1]

      lineAssert(isValidAddress(address), num, rawLine, address + ' is not a valid address (must be alpha-numeric)')

      string = line[line.index('.')+7:].strip()

      lineAssert(isValidString(string), num, rawLine, string + ' is not a valid string literal')

      constant = StringConstant(string)

      constants.append(constant)
      constantByAddress[address] = constant
      continue

    if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.SHORT':
      shorts = []
      address = tokens[0][:-1]

      lineAssert(isValidAddress(address), num, rawLine, address + ' is not a valid address (must be alpha-numeric)')

      for shortToken in tokens[2:]:
        lineAssert(isValidShort(shortToken), num, rawLine, shortToken + ' is not a valid short')
        shorts.append(parseShort(shortToken))

      constant = ShortConstant(shorts)

      constants.append(constant)
      constantByAddress[address] = constant
      continue

    if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.BYTE':
      bytes = []
      address = tokens[0][:-1]

      lineAssert(isValidAddress(address), num, rawLine, address + ' is not a valid address (must be alpha-numeric)')

      for byteToken in tokens[2:]:
        lineAssert(isValidByte(byteToken), num, rawLine, byteToken + ' is not a valid byte')
        bytes.append(parseByte(byteToken))

      constant = ByteConstant(bytes)

      constants.append(constant)
      constantByAddress[address] = constant
      continue

    if tokens[0][-1] == ':':
      address = tokens[0][:-1]

      lineAssert(isValidAddress(address), num, rawLine, address + ' is not a valid address (must be alpha-numeric)')
      lineAssert(len(tokens) == 1, num, rawLine, 'Unexpected trailing tokens after label')

      addresses[address] = currentAddress

      continue

    op = tokens[0].upper()

    lineAssert(op in opByCode, num, rawLine, 'Unknown op ' + op)

    currentAddress += 1

    opSpec = opByCode[op]

    if opSpec['Category'] == 'SYSTEM':
      lineAssert(len(tokens) == 1, num, rawLine, 'Unexpected trailing tokens after SYSTEM op')

      output.append(SystemResolver(opSpec['Operation']))

    if opSpec['Category'] == 'ALU':
      lineAssert(len(tokens) == 4, num, rawLine, 'Expected 3 arguments after an ALU op but got ' + str(len(tokens) - 1))
      lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
      lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')
      lineAssert(isValidRegister(tokens[3]), num, rawLine, tokens[3] + ' is not a valid register')

      output.append(AluResolver(opSpec['Operation'], parseRegister(tokens[1]), parseRegister(tokens[2]), parseRegister(tokens[3])))

    if opSpec['Category'] == 'LOAD_STORE':
      lineAssert(len(tokens) == 3, num, rawLine, 'Expected 2 arguments after a Load/Store op but got ' + str(len(tokens) - 1))
      lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
      lineAssert(isValidImmediateValue(tokens[2]), num, rawLine, tokens[2] + ' is not a valid immediate value')

      output.append(LoadStoreResolver(opSpec['Operation'], parseRegister(tokens[1]), parseImmediate(tokens[2])))

    if opSpec['Category'] == 'PERIPHERAL':
      lineAssert(len(tokens) == 2, num, rawLine, 'Expected 1 argument after a Peripheral op but got ' + str(len(tokens) - 1))
      lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')

      output.append(PeripheralResolver(opSpec['Operation'], parseRegister(tokens[1])))

    if opSpec['Category'] == 'JUMP':
      lineAssert(len(tokens) == 2, num, rawLine, 'Expected 1 argument after a Jump op but got ' + str(len(tokens) - 1))
      lineAssert(isValidAddress(tokens[1]), num, rawLine, tokens[1] + ' is not a valid jump address')

      output.append(JumpResolver(opSpec['Operation'], tokens[1], rawLine, num))

with open(sys.argv[2], 'w') as f:
  for resolver in output:
    f.write(resolver.resolveHex(addresses).replace('0x', '') + '\n')
