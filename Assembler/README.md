# Assembler

The assembler allows easy updates to the opcodes by reading the opcode table every time the assembler itself is run.

## Running
```bash
python assembler.py <path to assembly file> <path to instruction output file> <path to data output file>
```

## Adding/Updating Ops
Modify `ops.csv` to add or change any operations.

## Running Tests
To run the "end-to-end" tests, from a bash prompt (e.g. Git BASH) run
```bash
./tests/run.sh
```

To run the unit tests, run `assemblerSpecs.py`

## Opcodes
https://github.com/douggilliland/R32V2020/tree/master/Architecture/OpCodes
