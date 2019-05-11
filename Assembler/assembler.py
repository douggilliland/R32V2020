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

class AluResolver:
  def __init__(self, operation, rOut, r1, r2):
    self.operation = operation
    self.rOut = rOut
    self.r1 = r1
    self.r2 = r2

  def resolveHex(self, _):
    return hex(self.operation << 24 | self.rOut << 20 | self.r1 << 16 | self.r2 << 12)

class LoadStoreResolver:
  def __init__(self, operation, register, immediate):
    self.operation = operation
    self.register = register
    self.immediate = immediate

  def resolveHex(self, _):
    return hex(self.operation << 24 | self.register << 20 | self.immediate)

class PeripheralResolver:
  def __init__(self, operation, register):
    self.operation = operation
    self.register = register

  def resolveHex(self, _):
    return hex(self.operation << 24 | self.register << 20)

class JumpResolver:
  def __init__(self, operation, address, rawLine, lineNumber):
    self.operation = operation
    self.address = address
    self.rawLine = rawLine
    self.lineNumber = lineNumber

  def resolveHex(self, addresses):
    lineAssert(self.address in addresses, self.lineNumber, self.rawLine, self.address + ' is not a valid jump address')
    return hex(self.operation << 24 | addresses[address] << 12)

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
        looksLikeBinary = token.startswith("b'") or token.startswith("B'")
        v = unsafeParseBinary(token)
        valid = looksLikeBinary
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

with open(sys.argv[2], 'w') as f:
  for resolver in output:
    f.write(resolver.resolveHex(addresses).replace('0x', '') + '\n')
