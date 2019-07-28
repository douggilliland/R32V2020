#!/usr/bin/env bash

my_path=`dirname $0`

echo "Running Tests:"

for good_test in `find $my_path/ok -name "*.asm"`
do

  if python $my_path/../assembler.py $good_test > /dev/null; then
    printf '.'
  else
    echo "$good_test FAILED, output:"
    python $my_path/../assembler.py $good_test
    echo ""
  fi

done

for bad_test in `find $my_path/bad -name "*.asm"`
do

  if python $my_path/../assembler.py $bad_test > /dev/null; then
    echo "$bad_test returned a success staus code but was expected to fail, output:"
    python $my_path/../assembler.py $bad_test
    echo ""
  else
    printf '.'
  fi

done

echo ''
