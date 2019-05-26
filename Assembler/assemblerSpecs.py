#!/usr/bin/env python

import unittest
import assembler

class StripCommentsSpecs(unittest.TestCase):
  def test_empty_strings_have_no_comments_to_strip(self):
    self.assertEqual(assembler.stripComments(''), '')

  def test_lines_with_only_a_comment_strip_the_comment_out(self):
    self.assertEqual(assembler.stripComments('; foo'), '')

  def test_lines_followed_by_a_comment_strip_the_comment_out(self):
    self.assertEqual(assembler.stripComments('add r10,r11,r12; foo'), 'add r10,r11,r12')

  def test_comments_after_strings_are_stripped_out(self):
    self.assertEqual(assembler.stripComments('hi: .string "foo bar" ; comment'), 'hi: .string "foo bar" ')

  def test_semicolons_in_strings_are_not_stripped_out(self):
    self.assertEqual(assembler.stripComments('hi: .string "foo; bar"'), 'hi: .string "foo; bar"')

  def test_semicolons_in_strings_are_not_thrown_off_by_escaped_double_quotes(self):
    self.assertEqual(assembler.stripComments('hi: .string "foo; \\" ; bar"'), 'hi: .string "foo; \\" ; bar"')

class FormatHexSpecs(unittest.TestCase):
  def test_a_case_that_looks_like_an_add_instruction_at_addres_0_works(self):
    resolver = assembler.BinDestResolver(32, 7, 0, 0)
    self.assertTrue(assembler.formatHex(0, resolver, {}).startswith(':0400000020700000'))

  def test_a_result_has_the_correct_length(self):
    resolver = assembler.BinDestResolver(32, 7, 0, 0)
    self.assertEqual(len(assembler.formatHex(0, resolver, {})), 19)

  def test_checksum_value_itself_is_correct(self):
    self.assertEqual(assembler.checksum(int('040000002070000000', 16)), 108)

  def test_checksum_value_itself_is_correct_example_2(self):
    self.assertEqual(assembler.checksum(int('040010001122334400', 16)), 66)

  def test_the_checksum_bits_are_correct(self):
    resolver = assembler.BinDestResolver(32, 7, 0, 0)
    self.assertEqual(assembler.formatHex(0, resolver, {})[-2:], '6C')

  def test_the_address_is_encoded(self):
    resolver = assembler.BinDestResolver(32, 7, 0, 0)
    address = 4267
    self.assertEqual(assembler.formatHex(address, resolver, {})[-4:], '10AB')

if __name__ == '__main__':
  unittest.main()
