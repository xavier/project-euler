"""
Problem 38: Pandigital multiples

Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576.
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying
by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which
is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be
formed as the concatenated product of an integer with (1,2, ... , n)
where n > 1?
"""

def one_through_nine_pandigital?(n)
  digits_mask, all_nine = 0, 0b1111111110
  while n != 0 do
    d = n % 10
    n /= 10
    digits_mask |= (1<<d)
    return true if digits_mask >= all_nine
  end
  false
end

def count_digits(x)
  Math.log(x, 10).floor + 1
end

def concat(a, b)
  a*(10**count_digits(b)) + b
end

9876.downto(9123) do |i|
  n = concat(i, i*2)
  if one_through_nine_pandigital?(n)
    puts n
    break
  end
end