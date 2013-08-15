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
  n.even? ? n/2 : 3*n+1
end

def calculate_length_of_collatz_sequence(n)
  return 1 if n <= 1
  return 1 + length_of_collatz_sequence(collatz(n))
end

$length_cache = {}

def length_of_collatz_sequence(n)
  $length_cache[n] ||= calculate_length_of_collatz_sequence(n)
end

def longest_sequence(upper_bound)
  best_n, best_len = 0, 0
  (1..upper_bound).each do |n|
    len = length_of_collatz_sequence(n)
    if len > best_len
      best_n = n
      best_len = len
    end
  end
  [best_n, best_len]
end

raise "Wrong!" unless length_of_collatz_sequence(13) == 10

n, len = longest_sequence(1_000_000)

puts "n = #{n}"
puts "len = #{len}"
