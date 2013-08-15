"""
Problem 5: Smallest multiple

2520 is the smallest number that can be divided by each of the numbers from 1 to 10
without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
"""

require 'benchmark'

def positive_integers(start = 1)
  Enumerator.new do |enum|
    i = start
    while true
      enum.yield i
      i += 1
    end
  end.lazy
end

def pick_divisible_by(seq, n)
  seq.select { |x| x % n == 0 }
end

def pick_divisible_by_all(dividers, starting_from = 1)
  dividers.to_a.reverse.reduce(positive_integers(starting_from)) do |stream, divider|
    pick_divisible_by(stream, divider)
  end.first
end

def smallest_divisible_by_all(dividers)
  dividers.reduce(1) do |start, n|
    pick_divisible_by_all(1..n, start)
  end
end

raise "Wrong!" unless smallest_divisible_by_all(1..10) == 2520

puts smallest_divisible_by_all(1..20)

# Benchmark.bm do |bm|
#   bm.report do
#     (10..20).each do |n|
#       puts "#{n} -> " + smallest_divisible_by_all(1..n).to_s
#     end
#   end
# end


