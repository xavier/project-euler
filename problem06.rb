"""
Problem 6: Sum square difference

The sum of the squares of the first ten natural numbers is,

  1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,

  (1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers
and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural
numbers and the square of the sum.
"""

def sums(n)
  sum_of_squares, square_of_sum = 0, 0
  (1..n).each do |x|
    sum_of_squares += x*x
    square_of_sum  += x
  end
  [sum_of_squares, square_of_sum*square_of_sum]
end


raise "Wrong!" unless sums(10) == [385, 3025]

a, b = sums(100)

puts b - a