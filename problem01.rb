"""
Problem 1: Multiples of 3 and 5

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

def multiple_of?(x, y)
  x % y == 0
end

def multiples_of_3_or_5(upper_bound)
  (1...upper_bound).select { |x| multiple_of?(x, 3) || multiple_of?(x, 5) }
end

def sum_of_multiples_of_3_or_5(upper_bound)
  multiples_of_3_or_5(upper_bound).reduce(:+)
end

raise "Wrong!" unless multiples_of_3_or_5(10) == [3, 5, 6, 9]
raise "Wrong!" unless sum_of_multiples_of_3_or_5(10) == 23

puts sum_of_multiples_of_3_or_5(1000)