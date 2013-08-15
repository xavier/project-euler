# Encoding: UTF-8
"""
Problem 14: Longest Collatz sequence

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
Although it has not been proved yet (Collatz Problem), it is thought that all starting
numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

"""


def collatz(n)
  if n.even?
    n/2
  else
    3*n+1
  end
end

def collatz_sequence(n)
  seq = [n]
  while true
    c = collatz(seq.last)
    seq << c
    break if c <= 1
  end
  seq
end

def longest_sequence(upper_bound)
  best = []
  (1..upper_bound).each do |n|
    seq = collatz_sequence(n)
    best = seq if seq.size > best.size
  end
  best
end

raise "Wrong!" unless collatz_sequence(13) == [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]

longest = longest_sequence(1_000_000)

puts "length = #{longest.size}"
puts "seq = #{longest.inspect}"