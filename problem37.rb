"""
Problem 37: Truncatable primes

The number 3797 has an interesting property. Being prime itself, it is
possible to continuously remove digits from left to right, and remain
prime at each stage: 3797, 797, 97, and 7. Similarly we can work from
right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from
left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
"""

require "prime"
require "set"

class Array
  def to_i
    reduce(0) { |n, x| n*10 + x }
  end
end

def truncations(digits)
  (1...digits.size).map { |n| digits[0,n].to_i }
end

primes = Set.new
truncatables = []
max = 11

Prime.each do |prime|
  digits = prime.to_s.split('').map(&:to_i)
  if digits.size > 1 &&
     truncations(digits).all? { |n| n.prime? } &&
     truncations(digits.reverse).all? { |n| n.prime? }
     truncatables << prime
  end
  break if truncatables.size == max
end

puts truncatables.inspect
puts truncatables.reduce(:+)