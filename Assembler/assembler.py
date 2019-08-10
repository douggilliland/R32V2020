#!/usr/bin/env python

import csv
import os
import sys
import re

validRegisters = set()

REGISTER_ALIASES = {
  'ZERO': 0,
  'ONE': 1,
  'MINUS1': 2,
  'CCR': 3,
  'SAR': 4,
  'PAR': 5,
  'DAR': 6,
  'PC': 7,
  'GP0': 8,
  'GP1': 9,
  'GP2': 10,
  'GP3': 11,
  'GP4': 12,
  'GP5': 13,
  'GP6': 14,
  'GP7': 15
}

maxValueImm = {
  'IMM_DEST_16': 65535,
  'IMM_DEST_20': 1048575,
  'IMM_DEST_24': 16777215,
  'BIN_CMP_IMM': 65535,
  'BIN_DEST_IMM': 65535
}

supportedForms = set([
  'ADDR',
  'BIN_CMP',
  'BIN_CMP_IMM',
  'BIN_CONST',
  'BIN_DEST',
  'BIN_DEST_IMM',
  'IMM_DEST_16',
  'IMM_DEST_20',
  'IMM_DEST_24',
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
  'BIN_CMP': 3,
  'BIN_CMP_IMM': 3,
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

for alias in REGISTER_ALIASES:
  validRegisters.add(alias)

def userAssert(condition, message):
  if not condition:
    print message
    exit(1)

def lineAssert(condition, baseZeroLineNumber, rawLine, message):
  if not condition:
    print message
    print ''
    print 'Line', str(baseZeroLineNumber + 1) + ':'
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

def isValidRegister(token):
  return token.upper() in validRegisters

# Building structures and validation
for op in ops:
  op['Category'] = int(op['D31'] + op['D30'] + op['D29'], 2)

  op['Operation'] = int(op['D28'] + op['D27'] + op['D26'] + op['D25'] + op['D24'], 2)

  fullInstruction = (op['Category'] << 5) | op['Operation']

  assemblerAssert(op['Form'] in supportedForms, 'Op ' + op['Opcode'] + '\'s form ' + op['Form'] + ' is not a supported form (must be one of ' + formText + ')')

  if op['Form'] == 'BIN_CONST':
    assemblerAssert(isValidRegister(op['D23']), 'D23 must be a valid register in BIN_CONST-formed operations')
    assemblerAssert(isValidRegister(op['D19']), 'D19 must be a valid register in BIN_CONST-formed operations')
    assemblerAssert(isValidRegister(op['D15']), 'D15 must be a valid register in BIN_CONST-formed operations')

  assemblerAssert(fullInstruction not in fullInstructions, 'Op ' + op['Opcode'] + ' has a non-distinct combination of operation and category codes')

  fullInstructions.add(fullInstruction)

  op['CategorizedOp'] = fullInstruction

  opcode = op['Opcode'].upper()

  assemblerAssert(opcode not in opByCode, 'Op ' + op['Opcode'] + ' is repeated')

  opByCode[opcode] = op

class NoArgsResolver:
  def __init__(self, operation):
    self.operation = operation

  def resolveHex(self, _, __):
    return hex(self.operation << 24)

TWOS_COMP_24 = 16777215

def twosComp24(inputValue):
  return (inputValue ^ TWOS_COMP_24) + 1

class AddressResolver:
  def __init__(self, operation, address, rawLine, lineNumber, currentAddress):
    self.operation = operation
    self.address = address
    self.rawLine = rawLine
    self.lineNumber = lineNumber
    self.currentAddress = currentAddress

  def resolveHex(self, addresses, __):
    lineAssert(self.address in addresses, self.lineNumber, self.rawLine, 'Address ' + self.address + ' is not defined')

    offset = addresses[self.address] - self.currentAddress

    if offset < 0:
      offset = twosComp24(abs(offset))

    return hex(self.operation << 24 | (offset & TWOS_COMP_24))

class JumpDestResolver:
  def __init__(self, operation, address, rawLine, lineNumber, register):
    self.operation = operation
    self.address = address
    self.rawLine = rawLine
    self.lineNumber = lineNumber
    self.register = register

  def resolveHex(self, addresses, _):
    lineAssert(self.address in addresses, self.lineNumber, self.rawLine, 'Address ' + self.address + ' is not defined')
    return hex(self.operation << 24 | self.register << 20 | addresses[address] << 12)

class BinDestResolver:
  def __init__(self, operation, rOut, r1, r2):
    self.operation = operation
    self.rOut = rOut
    self.r1 = r1
    self.r2 = r2

  def resolveHex(self, _, __):
    return hex(self.operation << 24 | self.rOut << 20 | self.r1 << 16 | self.r2 << 12)

class BinDestImmResolver:
  def __init__(self, operation, rOut, r, immediate):
    self.operation = operation
    self.rOut = rOut
    self.r = r
    self.immediate = immediate

  def resolveHex(self, _, __):
    return hex(self.operation << 24 | self.rOut << 20 | self.r << 16 | self.immediate)

class UnDestResolver:
  def __init__(self, operation, rOut, r):
    self.operation = operation
    self.rOut = rOut
    self.r = r

  def resolveHex(self, _, __):
    return hex(self.operation << 24 | self.rOut << 20 | self.r << 12)

class ImmDestResolver:
  def __init__(self, operation, register, immediate):
    self.operation = operation
    self.register = register
    self.immediate = immediate

  def resolveHex(self, _, __):
    return hex(self.operation << 24 | self.register << 20 | self.immediate)

class DataLabelReferenceDestResolver:
  def __init__(self, operation, register, labelRef, lineNumber, rawLine):
    self.operation = operation
    self.register = register
    self.labelRef = labelRef
    self.lineNumber = lineNumber
    self.rawLine = rawLine

  def resolveHex(self, _, dataAddresses):
    parts = self.labelRef.split('.')

    isUpper = parts[1].upper() == 'UPPER'

    lineAssert(parts[0] in dataAddresses, self.lineNumber, self.rawLine, 'Data address reference ' + self.labelRef + ' does not reference an existing address')

    address = dataAddresses[parts[0]]

    if isUpper:
      address = address >> 16

    address = address & 65535

    return hex(self.operation << 24 | self.register << 20 | address << 2)

class ByteConstant:
  def __init__(self, byteLiterals):
    self.byteLiterals = byteLiterals + [0]*(4 - len(byteLiterals))

  def resolveHex(self):
    output = 0

    for byte in self.byteLiterals:
      output = output << 8
      output |= byte

    return [output]

class ShortConstant:
  def __init__(self, shortLiterals):
    self.shortLiterals = shortLiterals + [0]*(2 - len(shortLiterals))

  def resolveHex(self):
    output = 0

    for byte in self.shortLiterals:
      output = output << 16
      output |= byte

    return [output]

class LongConstant:
  def __init__(self, longToken):
    self.longToken = longToken[2:]

  def resolveHex(self):
    return [int(self.longToken, 16)]

def hexOfAsciiCode(char):
  return hex(ord(char))[2:]

class StringConstant:
  def __init__(self, string):
    self.string = string[1:-1]

  def resolveHex(self):
    chunks = []
    for i in xrange(0, len(self.string), 4):
      hex = ''

      for j in xrange(i, i+4):
        if j < len(self.string):
          hex += hexOfAsciiCode(self.string[j])
        else:
          hex += '00'
      chunks.append(int(hex, 16))

    if len(self.string) % 4 == 0:
      chunks.append(0)

    return chunks

class OutputLine:
  def __init__(self, rawLine, currentAddress):
    self.rawLine = rawLine
    self.instructionAddress = currentAddress
    self.instruction = None

  def setInstruction(self, instruction):
    self.instruction = instruction

output = []
addresses = {}
constantAddresses = set()
currentAddress = 0
constants = []
addressByConstant = {}

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
  for char in token:
    if not (char.isalnum() or char == '_'):
      return False

  return True

def isValidDataLabelReference(token):
  parts = token.split('.')

  return len(parts) == 2 and isValidAddress(parts[0]) and parts[1].upper() in ['UPPER', 'LOWER']

def formatAddressError(badAddress):
  return badAddress + ' is not a valid address (must be alpha-numeric, can contain underscores)'

def parseRegister(token):
  if token.upper() in REGISTER_ALIASES:
    return REGISTER_ALIASES[token.upper()]

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

def isValidImmediateValue(token, maxValue):
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

  return valid and 0 <= v and v <= maxValue

ZERO_FOUR = 73786976294838206464

def checksum(withoutChecksum):
  checksum = 0
  while withoutChecksum != 0:
    checksum += withoutChecksum & 255
    withoutChecksum = withoutChecksum >> 8

  return ((checksum^255) + 1) & 255

def formatInstructionHex(address, resolver, addresses, dataAddresses):
  op = int(resolver.resolveHex(addresses, dataAddresses), 0)
  withoutChecksum = ZERO_FOUR | op << 8 | address << 48
  return ':0' + hex(withoutChecksum | checksum(withoutChecksum))[2:-1].upper()

def formatDataHex(address, data):
  withoutChecksum = ZERO_FOUR | data << 8 | address << 48
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

        f.write('constant ' + op['Opcode'].upper() + '_OP \t: std_logic_vector(7 downto 0) := "' + padded + '";\n')
      print 'Constants written to OpCodeConstants.vhd'
      exit()

  userAssert(len(sys.argv) == 2, 'Usage: python assembler.py <input assembly>')
  userAssert(os.path.isfile(sys.argv[1]), 'Expected the path to an assembly file as the first argument')

  asmPath = sys.argv[1]
  insFile = asmPath[0:-4]+'_ins.HEX'
  datFile = asmPath[0:-4]+'_dat.HEX'
  lstFile = asmPath[0:-4]+'.lst'

  # Parse and write output
  with open(asmPath, 'r') as f:
    for num, rawLine in enumerate(f):

      outputLine = OutputLine(rawLine, currentAddress)

      output.append(outputLine)

      line = stripComments(rawLine)

      # Ignore empty lines
      if line.strip() == '':
        continue

      tokens = re.split('[\s|,]+', line.strip())

      if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.STRING':
        address = tokens[0][:-1]

        lineAssert(isValidAddress(address), num, rawLine, formatAddressError(address))

        string = line[line.index('.')+7:].strip()

        lineAssert(isValidString(string), num, rawLine, string + ' is not a valid string literal')

        constant = StringConstant(string)

        lineAssert(address not in constantAddresses, num, rawLine, address + ' has already been used as a label earlier in the program')

        constantAddresses.add(address)
        constants.append(constant)
        addressByConstant[constant] = address
        continue

      if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.LONG':
        shorts = []
        address = tokens[0][:-1]

        lineAssert(isValidAddress(address), num, rawLine, formatAddressError(address))

        longToken = tokens[2]

        lineAssert(isValidLong(longToken), num, rawLine, longToken + ' is not a valid long')

        constant = LongConstant(longToken)

        lineAssert(address not in constantAddresses, num, rawLine, address + ' has already been used as a label earlier in the program')

        constantAddresses.add(address)
        constants.append(constant)
        addressByConstant[constant] = address
        continue

      if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.SHORT':
        shorts = []
        address = tokens[0][:-1]

        lineAssert(isValidAddress(address), num, rawLine, formatAddressError(address))

        for shortToken in tokens[2:]:
          lineAssert(isValidShort(shortToken), num, rawLine, shortToken + ' is not a valid short')
          shorts.append(parseShort(shortToken))

        constant = ShortConstant(shorts)

        lineAssert(address not in constantAddresses, num, rawLine, address + ' has already been used as a label earlier in the program')

        constantAddresses.add(address)
        constants.append(constant)
        addressByConstant[constant] = address
        continue

      if len(tokens) > 1 and tokens[0][-1] == ':' and tokens[1].upper() == '.BYTE':
        bytes = []
        address = tokens[0][:-1]

        lineAssert(isValidAddress(address), num, rawLine, formatAddressError(address))

        for byteToken in tokens[2:]:
          lineAssert(isValidByte(byteToken), num, rawLine, byteToken + ' is not a valid byte')
          bytes.append(parseByte(byteToken))

        constant = ByteConstant(bytes)

        lineAssert(address not in constantAddresses, num, rawLine, address + ' has already been used as a label earlier in the program')

        constantAddresses.add(address)
        constants.append(constant)
        addressByConstant[constant] = address
        continue

      if tokens[0][-1] == ':':
        address = tokens[0][:-1]

        lineAssert(isValidAddress(address), num, rawLine, formatAddressError(address))
        lineAssert(len(tokens) == 1, num, rawLine, 'Unexpected trailing tokens after label')
        lineAssert(address not in addresses, num, rawLine, address + ' has already been used as a label earlier in the program')

        addresses[address] = currentAddress

        continue

      op = tokens[0].upper()

      lineAssert(op in opByCode, num, rawLine, 'Unknown op ' + op)

      currentAddress += 1

      opSpec = opByCode[op]

      if opSpec['Form'] == 'NO_ARGS':
        lineAssert(len(tokens) == 1, num, rawLine, 'Unexpected trailing tokens after op')

        outputLine.setInstruction(NoArgsResolver(opSpec['CategorizedOp']))

      elif opSpec['Form'] == 'BIN_CONST':
        lineAssert(len(tokens) == 1, num, rawLine, 'Unexpected trailing tokens after op')

        outputLine.setInstruction(BinDestResolver(opSpec['CategorizedOp'], parseRegister(opSpec['D23']), parseRegister(opSpec['D19']), parseRegister(opSpec['D15'])))

      elif opSpec['Form'] == 'ADDR':
        lineAssert(len(tokens) == 2, num, rawLine, 'Unexpected trailing tokens after op')

        lineAssert(isValidAddress(tokens[1]), num, rawLine, formatAddressError(tokens[1]))

        outputLine.setInstruction(AddressResolver(opSpec['CategorizedOp'], tokens[1], rawLine, num, currentAddress-1))

      elif opSpec['Form'] == 'BIN_DEST':
        lineAssert(len(tokens) == 4, num, rawLine, 'Expected 3 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[3]), num, rawLine, tokens[3] + ' is not a valid register')

        outputLine.setInstruction(BinDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), parseRegister(tokens[2]), parseRegister(tokens[3])))

      elif opSpec['Form'] == 'BIN_DEST_IMM':
        maxValue = maxValueImm['BIN_DEST_IMM']

        lineAssert(len(tokens) == 4, num, rawLine, 'Expected 3 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')
        lineAssert(isValidImmediateValue(tokens[3], maxValue), num, rawLine, tokens[3] + ' is not a valid immediate value')

        outputLine.setInstruction(BinDestImmResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), parseRegister(tokens[2]), parseImmediate(tokens[3])))

      elif opSpec['Form'] == 'BIN_CMP':
        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 2 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')

        outputLine.setInstruction(BinDestResolver(opSpec['CategorizedOp'], 3, parseRegister(tokens[1]), parseRegister(tokens[2])))

      elif opSpec['Form'] == 'BIN_CMP_IMM':
        maxValue = maxValueImm['BIN_CMP_IMM']

        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 2 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidImmediateValue(tokens[2], maxValue), num, rawLine, tokens[2] + ' is not a valid immediate value')

        outputLine.setInstruction(BinDestImmResolver(opSpec['CategorizedOp'], 3, parseRegister(tokens[1]), parseImmediate(tokens[2])))

      elif opSpec['Form'] == 'BIN_R1_DEST':
        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 2 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')

        outputLine.setInstruction(BinDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), 1, parseRegister(tokens[2])))

      elif opSpec['Form'] in ['IMM_DEST_16', 'IMM_DEST_20', 'IMM_DEST_24']:
        form = opSpec['Form']
        maxValue = maxValueImm[form]

        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 3 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(
          isValidImmediateValue(tokens[2], maxValue) or isValidDataLabelReference(tokens[2]),
          num,
          rawLine,
          tokens[2] + ' is neither a valid immediate value or a valid data label reference'
        )

        if isValidImmediateValue(tokens[2], maxValue):
          outputLine.setInstruction(ImmDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), parseImmediate(tokens[2])))
        else:
          outputLine.setInstruction(DataLabelReferenceDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), tokens[2], num, rawLine))

      elif opSpec['Form'] == 'UN_DEST':
        lineAssert(len(tokens) == 3, num, rawLine, 'Expected 2 arguments after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')
        lineAssert(isValidRegister(tokens[2]), num, rawLine, tokens[2] + ' is not a valid register')

        outputLine.setInstruction(UnDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), parseRegister(tokens[2])))

      elif opSpec['Form'] in ['R4_DEST', 'R5_DEST', 'R6_DEST']:
        lineAssert(len(tokens) == 2, num, rawLine, 'Expected 1 argument after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')

        outputLine.setInstruction(UnDestResolver(opSpec['CategorizedOp'], parseRegister(tokens[1]), constantFormRegister[opSpec['Form']]))

      elif opSpec['Form'] in ['UN_R1_DEST', 'UN_R4_DEST', 'UN_R5_DEST', 'UN_R6_DEST']:
        lineAssert(len(tokens) == 2, num, rawLine, 'Expected 1 argument after op but got ' + str(len(tokens) - 1))
        lineAssert(isValidRegister(tokens[1]), num, rawLine, tokens[1] + ' is not a valid register')

        outputLine.setInstruction(UnDestResolver(opSpec['CategorizedOp'], constantFormRegister[opSpec['Form']], parseRegister(tokens[1])))
      else:
        lineAssert(False, num, rawLine, 'Unexpectedly failed to parse line')

  dataAddresses = {}

  with open(datFile, 'w') as f:
    currentAddress = 0
    for constant in constants:
      dataAddresses[addressByConstant[constant]] = currentAddress
      for data in constant.resolveHex():
        f.write(formatDataHex(currentAddress, data) + '\n')
        currentAddress += 1

    f.write(':00000001FF\n')

  with open(insFile, 'w') as instF:
    with open(lstFile, 'w') as listF:
      for line in output:
        if line.instruction != None:
          instData = formatInstructionHex(line.instructionAddress, line.instruction, addresses, dataAddresses)
          instF.write(instData + '\n')
          addr = hex(line.instructionAddress)[2:]
          paddedAddr = '0'*(8 - len(addr)) + addr
          listF.write(paddedAddr + '\t' + instData[9:17] + '\t')
        listF.write(line.rawLine)
      instF.write(':00000001FF\n')
