#!/usr/bin/env python

import csv
import os
import sys
import re

validRegisters = set()

supportedForms = set([
  'ADDR',
  'ADDR_R7_DEST',
  'BIN_CMP',
  'BIN_DEST',
  'IMM_DEST',
  'NO_ARGS',
  'R4_DEST',
  'R5_DEST',
  'R6_DEST',
  'UN_DEST',
  'BIN_R1_DEST',
  'UN_R1_DEST',
  'UN_R4_DEST',
  'UN_R5_DEST',
  'UN_R6_DEST'
])

constantFormRegister = {
  'ADDR_R7_DEST': 7,
  'BIN_CMP': 3,
  'R4_DEST': 4,
  'R5_DEST': 5,
  'R6_DEST': 6,
  'BIN_R1_DEST': 1,
  'UN_R1_DEST': 1,
  'UN_R4_DEST': 4,
  'UN_R5_DEST': 5,
  'UN_R6_DEST': 6
}

for i in xrange(0, 16):
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

with open(opsPath) as csvfile:
  ops = list(csv.DictReader(csvfile))

opByCode = {}

fullInstructions = set()

formText = ', '.join(supportedForms)

# Building structures and validation
for op in ops:
  op['Category'] = int(op['D31'] + op['D30'] + op['D29'], 2)

  op['Operation'] = int(op['D28'] + op['D27'] + op['D26'] + op['D25'] + op['D24'], 2)

  fullInstruction = (op['Category'] << 5) | op['Operation']

  assemblerAssert(op['Form'] in supportedForms, 'Op ' + op['Opcode'] + '\'s form ' + op['Form'] + ' is not a supported form (must be one of ' + formText + ')')

  assemblerAssert(fullInstruction not in fullInstructions, 'Op ' + op['Opcode'] + ' has a non-distinct combination of operation and category codes')

  fullInstructions.add(fullInstruction)

  op['CategorizedOp'] = fullInstruction

  opcode = op['Opcode'].upper()

  assemblerAssert(opcode not in opByCode, 'Op ' + op['Opcode'] + ' is repeated')

  opByCode[opcode] = op

class NoArgsResolver:
  def __init__(self, operation):
    self.operation = operation

  def resolveHex(self, _):
    return hex(self.operation << 24)

class AddressResolver:
  def __init__(self, operation, address, rawLine, lineNumber):
    self.operation = operation
    self.address = address
    self.rawLine = rawLine
    self.lineNumber = lineNumber

  def resolveHex(self, addresses):
    lineAssert(self.address in addresses, self.lineNumber, self.rawLine, 'Address ' + self.address + ' is not defined')
    return hex(self.operation << 24 | addresses[address] << 12)

class AddressDestResolver:
  def __init__(self, operation, address, rawLine, lineNumber, register):
    self.operation = operation
    self.address = address
    self.rawLine = rawLine
    self.lineNumber = lineNumber
    self.register = register

  def resolveHex(self, addresses):
    lineAssert(self.address in addresses, self.lineNumber, self.rawLine, 'Address ' + self.address + ' is not defined')
    return hex(self.operation << 24 | self.register << 20 | addresses[address] << 12)

class BinDestResolver:
  def __init__(self, operation, rOut, r1, r2):
    self.operation = operation
    self.rOut = rOut
    self.r1 = r1
    self.r2 = r2

  def resolveHex(self, _):
    return hex(self.operation << 24 | self.rOut << 20 | self.r1 << 16 | self.r2 << 12)

class UnDestResolver:
  def __init__(self, operation, rOut, r):
    self.operation = operation
    self.rOut = rOut
    self.r = r

  def resolveHex(self, _):
    return hex(self.operation << 24 | self.rOut << 20 | self.r << 12)

class ImmDestResolver:
  def __init__(self, operation, register, immediate):
    self.operation = operation
    self.register = register
    self.immediate = immediate

  def resolveHex(self, _):
    return hex(self.operation << 24 | self.register << 20 | self.immediate)

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
    self.shortLiterals = shortLiterals + [0]*(2 - len(shortLiterals))

  def resolveHex(self):
    output = 0

    for byte in self.shortLiterals:
      output = output << 16
      output |= byte

    return [hex(output)]

class LongConstant:
  def __init__(self, longToken):
    self.longToken = longToken[2:]

  def resolveHex(self):
    return [self.longToken + ((8 - len(self.longToken))*'0')]

def hexOfAsciiCode(char):
  return hex(ord(char))[2:]

class StringConstant:
  def __init__(self, string):
    self.string = string

  def resolveHex(self):
    if self.string == '':
      return ['0000']
    chunks = []
    for i in xrange(0, len(self.string), 4):
      hex = ''

      for j in xrange(i, i+4):
        if j < len(self.string):
          hex += hexOfAsciiCode(self.string[j])
        else:
          hex += '00'
      chunks.append(hex)

    return chunks

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

def isValidLong(token):
  try:
    v = int(token, 0)
    return 0 <= v and v <= 4294967296
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

ZERO_FOUR = 73786976294838206464

def checksum(withoutChecksum):
  checksum = 0
  while withoutChecksum != 0:
    checksum += withoutChecksum & 255
    withoutChecksum = withoutChecksum >> 8

  return ((checksum^255) + 1) & 255

def formatHex(address, resolver, addresses):
  op = int(resolver.resolveHex(addresses), 0)
  withoutChecksum = ZERO_FOUR | op << 8 | address << 48
  return ':0' + hex(withoutChecksum | checksum(withoutChecksum))[2:-1].upper()

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

if __name__ == '__main__':
  if '--gen-constants' in sys.argv:
    with open(os.path.join(myDir, 'OpCodeConstants.vhd'), 'w') as f:
      for op in ops:

        code = bin(op['CategorizedOp'])[2:]

        padded = '0'*(8 - len(code)) + code

        f.write('constant ' + op['Opcode'].upper() + ' : std_Logic_Vector(7 downto 0) := "' + padded + '";\n')
      print 'Constants written to OpCodeConstants.vhd'
      exit()

  if len(sys.argv) == 2:
    asmPath = sys.argv[1]
    insFile = asmPath[0:-4]+'_ins.HEX'
    datFile = asmPath[0:-4]+'_dat.HEX'
#  userAssert(len(sys.argv) == 4, 'Usage: python assembler.py <input assembly> <output binary> <output data>')
#  userAssert(os.path.isfile(sys.argv[1]), 'Expected the path to an assembly file as the first argument')
#  asmPath = sys.argv[1]

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

      if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.LONG':
        shorts = []
        address = tokens[0][:-1]

        lineAssert(isValidAddress(address), num, rawLine, address + ' is not a valid address (must be alpha-numeric)')

        longToken = tokens[2]

        lineAssert(isValidLong(longToken), num, rawLine, longToken + ' is not a valid long')

        constant = LongConstant(longToken)

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

      lineAssert(op in opByCode or op == 'INV' or op == 'JPS', num, rawLine, 'Unknown op ' + op)

      currentAddress += 1

      if op == 'JPS':
        lineAssert(len(tokens) == 3, num, rawLine, 'Unexpected trailing tokens after op')
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidAddress(tokens[2]), num, rawLine, tokens[2] + ' is not a valid address')

        output.append(UnDestResolver(opByCode['PSS']['CategorizedOp'], 4, parseRegister(tokens[1])))
        output.append(AddressDestResolver(opByCode['JSR']['CategorizedOp'], tokens[2], rawLine, num, 7))

        # Since we're writing 2 operations
        currentAddress += 1
        continue

      if op == 'INV':
        lineAssert(len(tokens) == 3, num, rawLine, 'Unexpected trailing tokens after op')
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')

        output.append(BinDestResolver(opByCode['XRS']['CategorizedOp'], parseRegister(tokens[1]), 3, parseRegister(tokens[2])))
        continue

      opSpec = opByCode[op]

      if opSpec['Form'] == 'NO_ARGS':
        lineAssert(len(tokens) == 1, num, rawLine, 'Unexpected trailing tokens after op')

        output.append(NoArgsResolver(opSpec['CategorizedOp']))

      elif opSpec['Form'] == 'ADDR':
        lineAssert(len(tokens) == 2, num, rawLine, 'Unexpected trailing tokens after op')

        lineAssert(isValidAddress(tokens[1]), num, rawLine, tokens[1] + ' is not a valid address')

        output.append(AddressResolver(opSpec['CategorizedOp'], tokens[1], rawLine, num))

      elif opSpec['Form'] == 'ADDR_R7_DEST':
        lineAssert(len(tokens) == 2, num, rawLine, 'Unexpected trailing tokens after op')

        lineAssert(isValidAddress(tokens[1]), num, rawLine, tokens[1] + ' is not a valid address')

        output.append(AddressDestResolver(opSpec['CategorizedOp'], tokens[1], rawLine, num, 7))

      elif opSpec['Form'] == 'BIN_DEST':
        lineAssert(len(tokens) == 4, num, rawLine, 'Expected 3 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[3]), num, rawLine, tokens[3] + ' is not a valid register')

        output.append(BinDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), parseRegister(tokens[2]), parseRegister(tokens[3])))

      elif opSpec['Form'] == 'BIN_CMP':
        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 3 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')

        output.append(BinDestResolver(opSpec['CategorizedOp'], 3, parseRegister(tokens[1]), parseRegister(tokens[2])))

      elif opSpec['Form'] == 'BIN_R1_DEST':
        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 2 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')

        output.append(BinDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), 1, parseRegister(tokens[2])))

      elif opSpec['Form'] == 'IMM_DEST':
        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 3 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidImmediateValue(tokens[2]), num, rawLine, tokens[2] + ' is not a valid immediate value')

        output.append(ImmDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), parseImmediate(tokens[2])))

      elif opSpec['Form'] == 'UN_DEST':
        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 2 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')

        output.append(UnDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), parseRegister(tokens[2])))

      elif opSpec['Form'] in ['R4_DEST', 'R5_DEST', 'R6_DEST']:
        lineAssert(len(tokens) == 2, num, rawLine, 'Expected 1 argument after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')

        output.append(UnDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), constantFormRegister[opSpec['Form']]))

      elif opSpec['Form'] in ['UN_R1_DEST', 'UN_R4_DEST', 'UN_R5_DEST', 'UN_R6_DEST']:
        lineAssert(len(tokens) == 2, num, rawLine, 'Expected 1 argument after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')

        output.append(UnDestResolver(opSpec['CategorizedOp'], constantFormRegister[opSpec['Form']], parseRegister(tokens[1])))
      else:
        lineAssert(False, num, rawLine, 'Unexpectedly failed to parse line')

#  with open(sys.argv[2], 'w') as f:
  with open(insFile, 'w') as f:
    for currentAddress, resolver in enumerate(output):
      f.write(formatHex(currentAddress, resolver, addresses) + '\n')
    f.write(':00000001FF\n')

#  with open(sys.argv[3], 'w') as f:
  with open(datFile, 'w') as f:
    for constant in constants:
      for line in constant.resolveHex():
        f.write(line.replace('0x', '') + '\n')