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

def user_assert(condition, message):
  if not condition:
    print message
    exit()

def line_assert(condition, num, rawLine, message):
  if not condition:
    print message
    print ''
    print 'Line', str(num) + ':'
    print rawLine
    exit()

def assembler_assert(condition, message):
  if not condition:
    print message
    print ''
    print '(This is a complier-level error indicating an assembler programmer mistake not an assembler user mistake)'
    exit()

myDir = os.path.dirname(__file__)
opsPath = os.path.join(myDir, 'ops.csv')

assembler_assert(os.path.isfile(opsPath), 'Expected an ops file at ' + os.path.abspath(opsPath))

user_assert(len(sys.argv) == 3, 'Usage: python assembler.py <input assembly> <output binary>')
user_assert(os.path.isfile(sys.argv[1]), 'Expected the path to an assembly file as the first argument')
asmPath = sys.argv[1]

with open(opsPath) as csvfile:
  ops = list(csv.DictReader(csvfile))

op_by_code = {}

# For testing that a code is not repeated within a category
code_per_category = {
  'SYSTEM': [],
  'ALU': [],
  'LOAD_STORE': [],
  'PERIPHERAL': [],
  'JUMP': []
}

for op in ops:
  assembler_assert(op['Category'] in CATEGORY_CODE, 'Op ' + op['Opcode'] + ' has unrecognized category ' + op['Category'] + ' (it should be one of ' + ', '.join(list(CATEGORY_CODE)) + ')')

  assembler_assert(op['Operation'] not in code_per_category[op['Category']], 'The Operation ' + op['Operation'] + ' is repeated more than once for the category ' + op['Category'])

  code_per_category[op['Category']].append(op['Operation'])

  operation = int(op['Operation'])

  op['Operation'] = operation

  assembler_assert(0 <= operation and operation <= 63, 'Op ' + op['Opcode'] + ' must have an Operation between 0 and 63 inclusive')

  opcode = op['Opcode'].upper()

  assembler_assert(opcode not in op_by_code, 'Op ' + op['Opcode'] + ' is repeated')

  op_by_code[opcode] = op

with open(asmPath, 'r') as f:
  for num, line in enumerate(f):

    # Ignore empty lines
    if line.strip() == '':
      continue

    tokens = re.split('\s+', line.strip())

    op = tokens[0].upper()

    line_assert(op in op_by_code, num, line, 'Unknown op ' + op)
