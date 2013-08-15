"""
Problem 2: Even Fibonacci numbers

Each new term in the Fibonacci sequence is generated by adding the previous two terms.
By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed
four million, find the sum of the even-valued terms.
"""

def enumerate_fibonacci_numbers_until(n)
  Enumerator.new do |enum|
    a, b = 0, 1
    f = 0
    while f < n
      f = a + b
      enum.yield f
      a, b = b, f
    end
  end
end

puts enumerate_fibonacci_numbers_until(4_000_000).select { |x| x.even? }.reduce(:+)