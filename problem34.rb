"""
Problem 34: Digit factorials

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
"""

def fact(x) ; x > 0 ? x*fact(x-1) : 1 end

FACT_DIGIT = (0..9).map { |x| fact(x) }.to_a

def find_upper_bound
  f9, n = FACT_DIGIT[9], 1
  n += 1 while digits_of(f9 * n).size >= n
  f9 * n
end

def digits_of(n)
  digits = []
  while n > 0
    digits << n % 10
    n /= 10
  end
  digits
end

def sum_factorial_of_digits(digits)
  digits.reduce(0) { |sum, x| sum + FACT_DIGIT[x] }
end

def enumerate(max)
  Enumerator.new do |enum|
    n = 2
    while n < max
      enum.yield n, digits_of(n)
      n += 1
    end
  end.lazy
end

def curious_numbers
  enumerate(find_upper_bound).select do |x, digits|
    x == sum_factorial_of_digits(digits)
  end.map do |x, digits|
    x
  end
end

puts curious_numbers.reduce(:+)