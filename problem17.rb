"""
Problem 17: Number letter counts

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then
there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use
of "and" when writing out numbers is in compliance with British usage.
"""

KNOWN_WORDS = {
  0   => "zero",
  1   => "one",
  2   => "two",
  3   => "three",
  4   => "four",
  5   => "five",
  6   => "six",
  7   => "seven",
  8   => "eight",
  9   => "nine",
  10  => "ten",
  11  => "eleven",
  12  => "twelve",
  13  => "thirteen",
  14  => "fourteen",
  15  => "fifteen",
  16  => "sixteen",
  17  => "seventeen",
  18  => "eighteen",
  19  => "nineteen",
  20  => "twenty",
  30  => "thirty",
  40  => "forty",
  50  => "fifty",
  60  => "sixty",
  70  => "seventy",
  80  => "eighty",
  90  => "ninety",
}

class InefficientSolver

  def in_words(n)
    if KNOWN_WORDS[n]
      KNOWN_WORDS[n]
    else
      if n < 100
        a, b = n / 10, n % 10
        in_words(a*10) + "-" + in_words(b)
      elsif n < 1000
        a, b = n / 100, n % 100
        in_words(a) + " hundred" + (b > 0 ? " and " + in_words(b) : "")
      elsif n < 10000
        a, b = n / 1000, n % 1000
        in_words(a) + " thousand" + (b > 0 ? " and " + in_words(b) : "")
      else
        raise ArgumentError
      end
    end
  end

  def count_letters(number_in_words)
    number_in_words.gsub(/[ -]/, "").length
  end

  def length_in_words(n)
    count_letters(in_words(n))
  end

end

class EfficientSolver

  KNOWN_LENGTHS = KNOWN_WORDS.each_with_object({}) { |(n, w), h| h[n] = w.length }
  SPECIAL_LENGTHS = {
    100  => "hundred".length,
    1000 => "thousand".length,
    :and => 3
  }

  def length_in_words(n)
    if KNOWN_LENGTHS[n]
      KNOWN_LENGTHS[n]
    else
      if n < 100
        a, b = n / 10, n % 10
        length_in_words(a*10) + length_in_words(b)
      elsif n < 1000
        a, b = n / 100, n % 100
        length_in_words(a) + SPECIAL_LENGTHS[100] + (b > 0 ? SPECIAL_LENGTHS[:and] + length_in_words(b) : 0)
      elsif n < 10000
        a, b = n / 1000, n % 1000
        length_in_words(a) + SPECIAL_LENGTHS[1000] + (b > 0 ? SPECIAL_LENGTHS[:and] + length_in_words(b) : 0)
      else
        raise ArgumentError
      end
    end
  end

end

[InefficientSolver.new, EfficientSolver.new].each do |solver|

  puts solver.class.name

  raise "Wrong!" unless solver.length_in_words(342) == 23
  raise "Wrong!" unless solver.length_in_words(115) == 20

  puts (1..1000).map { |n| solver.length_in_words(n) }.reduce(:+)

end
