"""
Problem 9: Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

  a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
"""

def enumerate_positive_naturals
  Enumerator.new do |enum|
    i = 0
    while true
      enum.yield i
      i += 1
    end
  end.lazy
end

# Euclid's formula:
# http://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple
def make_triplet(m, n)
  m2, n2 = m*m, n*n
  [m2-n2, 2*m*n, m2+n2]
end

def brute_force
  enumerate_positive_naturals.each do |m|
    enumerate_positive_naturals.take(m).each do |n|
      triplet = make_triplet(m, n)
      return triplet if triplet.reduce(:+) == 1000
    end
  end
end

puts brute_force.inspect