"""
Problem 3: Largest prime factor

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
"""

def prime_factors(n)
  return [] if n == 1
  factor = (2..n).find { |x| n % x == 0 }
  [factor] + prime_factors(n / factor)
end

def largest_prime_factor(n)
  prime_factors(n).last
end

raise "Wrong!" unless largest_prime_factor(13195) == 29

puts largest_prime_factor(600851475143)