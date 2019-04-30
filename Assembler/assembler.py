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

output = bytearray()

def writeSystem(systemCode, output, operation):
  todo('System level ops')

def writeALU(aluCode, output, operation, regIn1, regIn2, regOut):
  todo('ALU level ops')

def writeLoadStore(loadStoreCode, output, operation, register, immediate):
  todo('Load/Store level ops')

def writePeripheral(peripheralCode, output, operation, register):
  todo('Peripheral level ops')

def writeJump(jumpCode, output, operation, address):
  todo('Jump level ops')

def isValidAddress(token):
  todo('Check whether a token is a valid jump address for real')

def parseAddress(token):
  todo('Parse a jump address for real')

def isValidRegister(token):
  return token.upper() in validRegisters

def parseRegister(token):
  return int(token[1:])

def parseImmediate(token):
  try:
    return int(token)
  except:
    try:
      return int(token, 0)
    except:
      todo('Parse immediate values (binary, etc...) for real')

def isValidImmediateValue(token):
  try:
    v = int(token)
  except:
    try:
      v = int(token, 0)
    except:
      todo('Check that tokens are valid immediate values (size, hex, binary, etc...) for real')

  return -32768 <= v and v <= 32767

# Parse and write output
with open(asmPath, 'r') as f:
  for num, line in enumerate(f):

    # Ignore empty lines
    if line.strip() == '':
      continue

    tokens = re.split('\s+', line.strip())

    op = tokens[0].upper()

    lineAssert(op in opByCode, num, line, 'Unknown op ' + op)

    opSpec = opByCode[op]

    if opSpec['Category'] == 'SYSTEM':
      lineAssert(len(tokens) == 1, num, line, 'Unexpected trailing tokens after SYSTEM op')

      writeSystem(CATEGORY_CODE['SYSTEM'], output, opSpec['Operation'])

    if opSpec['Category'] == 'ALU':
      lineAssert(len(tokens) == 4, num, line, 'Expected 3 arguments after an ALU op but got ' + str(len(tokens) - 1))
      lineAssert(isValidRegister(tokens[1]), num, line, tokens[1] + ' is not a valid register')
      lineAssert(isValidRegister(tokens[2]), num, line, tokens[2] + ' is not a valid register')
      lineAssert(isValidRegister(tokens[3]), num, line, tokens[3] + ' is not a valid register')

      writeALU(CATEGORY_CODE['ALU'], output, opSpec['Operation'], parseRegister(tokens[1]), parseRegister(tokens[2]), parseRegister(tokens[3]))

    if opSpec['Category'] == 'LOAD_STORE':
      lineAssert(len(tokens) == 3, num, line, 'Expected 2 arguments after a Load/Store op but got ' + str(len(tokens) - 1))
      lineAssert(isValidRegister(tokens[1]), num, line, tokens[1] + ' is not a valid register')
      lineAssert(isValidImmediateValue(tokens[2]), num, line, tokens[2] + ' is not a valid immediate value')

      writeLoadStore(CATEGORY_CODE['LOAD_STORE'], output, opSpec['Operation'], parseRegister(tokens[1]), parseImmediate(tokens[2]))

    if opSpec['Category'] == 'PERIPHERAL':
      lineAssert(len(tokens) == 2, num, line, 'Expected 1 argument after a Peripheral op but got ' + str(len(tokens) - 1))
      lineAssert(isValidRegister(tokens[1]), num, line, tokens[1] + ' is not a valid register')

      writePeripheral(CATEGORY_CODE['PERIPHERAL'], output, opSpec['Operation'], parseRegister(tokens[1]))

    if opSpec['Category'] == 'JUMP':
      lineAssert(len(tokens) == 2, num, line, 'Expected 1 argument after a Jump op but got ' + str(len(tokens) - 1))
      lineAssert(isValidAddress(tokens[1]), num, line, tokens[1] + ' is not a valid jump address')

      writeJump(CATEGORY_CODE['JUMP'], output, opSpec['Operation'], parseAddress(tokens[1]))

with open(sys.argv[2], 'wb') as f:
  todo('Write output for real using `output` variable')
