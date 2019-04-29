#!/usr/bin/env python

import csv
import os
import sys

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

def assembler_assert(condition, message):
  if not condition:
    print message
    print ''
    print '(This is a complier-level error indicating an assembler programmer mistake not an assembler user mistake)'
    exit()

myDir = os.path.dirname(__file__)
opsPath = os.path.join(myDir, 'ops.csv')

assembler_assert(os.path.isfile(opsPath), 'Expected an ops file at ' + os.path.abspath(opsPath))

user_assert(len(sys.argv) == 3, 'Usage: assembler <input assembly> <output binary>')
user_assert(os.path.isfile(sys.argv[1]), 'Expected the path to an assembly file as the first argument')

with open(opsPath) as csvfile:
  ops = list(csv.DictReader(csvfile))

# Some per-op expectations, just to help ensure things are consistent
for op in ops:
  assembler_assert(op['Category'] in CATEGORY_CODE, 'Op ' + op['Opcode'] + ' has unrecognized category ' + op['Category'] + ' (it should be one of ' + ', '.join(list(CATEGORY_CODE)) + ')')

  operation = int(op['Operation'])

  op['Operation'] = operation

  assembler_assert(0 <= operation and operation <= 63, 'Op ' + op['Opcode'] + ' must have an Operation between 0 and 63 inclusive')
