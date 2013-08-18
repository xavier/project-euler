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

$known = {
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

def in_words(n)
  if $known[n]
    $known[n]
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

def solve
  (1..1000).map { |n| count_letters(in_words(n)) }.reduce(:+)
end

raise "Wrong!" unless count_letters(in_words(342)) == 23
raise "Wrong!" unless count_letters(in_words(115)) == 20

puts solve