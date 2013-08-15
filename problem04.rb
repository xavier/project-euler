"""
Problem 4: Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 x 99.

Find the largest palindrome made from the product of two 3-digit numbers.
"""

def palindrome?(n)
  n.to_s == n.to_s.reverse
end

def products(upper_bounder, lower_bound)
  Enumerator.new do |enum|
    upper_bounder.downto(lower_bound) do |x|
      upper_bounder.downto(lower_bound) do |y|
        enum.yield x, y, x*y
      end
    end
  end
end

puts products(1000, 100).find { |x, y, p| palindrome?(p) }.inspect