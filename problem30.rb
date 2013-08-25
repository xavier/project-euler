"""
Problem 30: Digit fifth powers

Surprisingly there are only three numbers that can be written as
the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4

As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of
fifth powers of their digits.
"""

def digits(n)
  if n == 0
    res = [0]
  else
    res = []
    while n > 0
      d = n % 10
      n /= 10
      res.unshift(d)
    end
  end
  res
end

def digit_powers(n)
  (0..9).map { |x| x**n }
end

def numbers_writeable_as_sum_of_digit_powers(n)
  powers = digit_powers(n)
  max = powers.reduce(:+)
  (2..max).select do |x|
    x == digits(x).reduce(0) { |sum, d| sum + powers[d] }
  end
end

raise "Wrong!" unless numbers_writeable_as_sum_of_digit_powers(4) == [1634, 8208, 9474]

r =  numbers_writeable_as_sum_of_digit_powers(5)
puts r.inspect
puts r.reduce(:+)