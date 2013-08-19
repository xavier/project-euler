"""
Problem 21: Amicable numbers

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which
divide evenly into n).  If d(a) = b and d(b) = a, where a != b, then a and b are an
amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
"""

require 'set'

def divisors_of(n)
  n == 1 ? [1] : (1...n).select { |x| n % x == 0 }
end

def d(n)
  divisors_of(n).reduce(:+)
end

raise "Wrong!" unless divisors_of(220) == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]
raise "Wrong!" unless divisors_of(284) == [1, 2, 4, 71, 142]
raise "Wrong!" unless d(220) == 284
raise "Wrong!" unless d(284) == 220

def pluck(set)
  e = set.first
  set.delete(e)
  e
end

def find_amicable_numbers(range)
  candidates = Set.new(range)
  d_lut = {}
  calc_d = ->(a) { d_lut[a] ||= d(a) }
  amicables = Set.new
  c = 0
  while not candidates.empty?
    puts c += 1
    a = pluck(candidates)
    b = calc_d.(a)
    candidates.delete(b)
    if b != a && calc_d.(b) == a
      amicables << [a, b].sort
    end
  end
  amicables
end

amicables = find_amicable_numbers(1..10000)

puts amicables.inspect
puts amicables.reduce(0) { |sum, (a, b)| sum + a + b }