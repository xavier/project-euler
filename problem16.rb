"""
Problem 16: Power digit sum

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
"""

def sum_of_digits(n)
  n == 0 ? 0 : (n%10) + sum_of_digits(n/10)
end

raise "Wrong!" unless sum_of_digits(1<<15) == 26
puts sum_of_digits(1<<1000)