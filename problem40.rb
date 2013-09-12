"""
Problem 40: Champernowne's constant

An irrational decimal fraction is created by concatenating the positive integers:

  0.123456789101112131415161718192021...

  It can be seen that the 12th digit of the fractional part is 1.

  If dn represents the nth digit of the fractional part, find the value of the following expression.

  d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
"""

def calculate_fractional_part(limit)
  (1..limit).each_with_object([]) { |n, fp| fp << n.to_s }.join
end

fractional_part = calculate_fractional_part(1_000_000)

answer = 1
(0..6).each do |exponent|
  offset = (10**exponent)-1
  answer *= fractional_part[offset].to_i
end

puts answer