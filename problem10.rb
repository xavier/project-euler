"""
Problem 10: Summation of primes

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""

require 'prime' # Ruby 2.0, Yay! :)

def sum_of_primes(upper_bound)
  Prime.each(upper_bound).reduce(:+)
end

raise "Wrong!" unless sum_of_primes(10) == 17

puts sum_of_primes(2_000_000)