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

if __name__ == '__main__':
  unittest.main()
