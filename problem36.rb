"""
Problem 36: Double-base palindromes

The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
"""

def palindrome_in_base?(n, base)
  s = n.to_s(base)
  s == s.reverse
end

def double_base_palindrome?(n)
  palindrome_in_base?(n, 10) && palindrome_in_base?(n, 2)
end

def double_base_palindromes(upper_bound)
  (1...upper_bound).select { |n| double_base_palindrome?(n) }
end

raise "Wrong!" unless palindrome_in_base?(585, 10)
raise "Wrong!" unless palindrome_in_base?(585, 2)

puts double_base_palindromes(1_000_000).reduce(:+)