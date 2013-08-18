"""
Problem 20: Factorial digit sum

n! means n x (n − 1) x ... x 3 x 2 x 1

For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
"""

def fact(n)
  n == 0 ? 1 : n*fact(n-1)
end

def sum_of_digits(n)
  n == 0 ? 0 : n%10 + sum_of_digits(n/10)
end

puts sum_of_digits(fact(100))