"""
Problem 35: Circular primes

The number, 197, is called a circular prime because all rotations of the digits:
197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
"""

require 'prime'
require 'set'

def rotate_digits(number, exponent)
  a, b = number/10, number%10
  b * exponent + a
end

def cycle_rotate_digits(number)
  Enumerator.new do |enum|
    e = 10**Math.log(number, 10).floor
    n = rotate_digits(number, e)
    while n != number
      enum.yield n
      n = rotate_digits(n, e)
    end
  end
end

def circular_primes_up_to(limit)
  primes = Set.new(Prime.each(limit))
  circular_primes = Set.new
  primes.each do |prime|
    circular = true
    cycle_rotate_digits(prime).each do |rotated|
      unless primes.include?(rotated)
        circular = false
        break
      end
    end
    circular_primes << prime if circular
  end
  circular_primes
end

raise "Wrong!" unless circular_primes_up_to(100).to_a == [2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97]

puts circular_primes_up_to(1_000_000).inspect