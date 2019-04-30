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
    return ''

class AluResolver:
  def __init__(self, operation, rOut, r1, r2):
    self.operation = operation
    self.rOut = rOut
    self.r1 = r1
    self.r2 = r2

  def resolveHex(self, _):
    return ''

class LoadStoreResolver:
  def __init__(self, operation, register, immediate):
    self.operation = operation
    self.register = register
    self.immediate = immediate

  def resolveHex(self, _):
    return ''

class LoadStoreResolver:
  def __init__(self, operation, register, immediate):
    self.operation = operation
    self.register = register
    self.immediate = immediate

  def resolveHex(self, _):
    return ''

class PeripheralResolver:
  def __init__(self, operation, register):
    self.operation = operation
    self.register = register
    self.immediate = immediate

  def resolveHex(self, _):
    return ''

class JumpResolver:
  def __init__(self, operation, address):
    self.operation = operation
    self.address = address

  def resolveHex(self, addresses):
    return ''

output = []
addresses = {}
currentAddress = 0

def isValidAddress(token):
  return token.isalnum()

def isValidRegister(token):
  return token.upper() in validRegisters

def parseRegister(token):
  return int(token[1:])

def unsafeParseBinary(token):
  looksLikeBinary = token.startswith("b'") or token.startswith("B'")
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
        v = unsafeParseBinary(token)
        valid = True
      except:
        pass

  return valid and -32768 <= v and v <= 32767

# Parse and write output
with open(asmPath, 'r') as f:
  for num, rawLine in enumerate(f):

    line = rawLine

    if ';' in rawLine:
      line = rawLine[:rawLine.index(';')]

    # Ignore empty lines
    if line.strip() == '':
      continue

    tokens = re.split('[\s|,]+', line.strip())

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

      output.append(JumpResolver(opSpec['Operation'], tokens[1]))

with open(sys.argv[2], 'wb') as f:
  todo('Write output for real using `output` variable')
