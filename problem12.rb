"""
Problem 12: Highly divisible triangular number

The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28
We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?
"""

def count_divisors(n)
  sqrt = Math.sqrt(n).round
  divisors = 2 * (1..sqrt).count { |x| n % x == 0 }
  divisors -= 1 if sqrt*sqrt == n
  divisors
end

def triangle_number(max_divisors)
  triangle_number, i = 0, 1
  while count_divisors(triangle_number) < max_divisors
    triangle_number += i
    i+= 1
  end
  triangle_number
end

raise "Wrong!" unless triangle_number(4) == 6

puts triangle_number(500)