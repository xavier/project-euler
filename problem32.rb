"""
Problem 32: Pandigital products

We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity
can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only
include it once in your sum.
"""

require 'set'

def one_through_nine_pandigital?(*numbers)
  digits_mask, all_nine = 0, 0b1111111110
  numbers.each do |n|
    while n != 0 do
      d = n % 10
      n /= 10
      digits_mask |= (1<<d)
      return true if digits_mask >= all_nine
    end
  end
  false
end

def solve
  pandigitals = Set.new
  (2..100).each do |a|
    start = a > 9 ? 123 : 1234
    (start..(10000/a)).each do |b|
      prod = a*b
      pandigitals << prod if one_through_nine_pandigital?(a, b, prod)
    end
  end
  pandigitals.reduce(:+)
end

puts solve