"""
Problem 7: 10001st prime

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
we can see that the 6th prime is 13.

What is the 10 001st prime number?
"""

def prime_number_candidates
  Enumerator.new do |enum|
    i = 2
    enum.yield i
    while true
      i += 1
      enum.yield i if i.odd?
    end
  end.lazy
end

def nth_prime(n)
  primes_found = []
  candidates = prime_number_candidates
  while primes_found.size <= n
    p = candidates.next
    lim = Math.sqrt(p).ceil
    has_prime_factor = primes_found.lazy.select { |f| f < lim }.find { |f| (p % f) == 0 }
    if !has_prime_factor
      primes_found << p
    end
  end
  return primes_found.last
end

raise "Wrong!" unless nth_prime(6) == 13

puts nth_prime(10_001)
