"""
Problem 19: Counting Sundays

You are given the following information, but you may prefer to do some research
for yourself.

- 1 Jan 1900 was a Monday.
- Thirty days has September,
  April, June and November.
  All the rest have thirty-one,
  Saving February alone,
  Which has twenty-eight, rain or shine.
  And on leap years, twenty-nine.
- A leap year occurs on any year evenly divisible by 4,
  but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
"""

#
# Gauss' algorithm for finding the day of week:
#
# yy = year - 1 for January or February
# yy = year for other months
# d  = day (1 to 31)
# m  = shifted month (March = 1, February = 12)
# y  = last two digits of yy
# c  = first two digits of yy
# w  = day of week (Sunday = 0, Saturday = 6)
#
# w = (d+floor(2.6*m-0.2)+y+floor(y/4)+floor(c/4)-2*c) mod 7
#
#
def day_of_week(year, month, day)
    d  = day
    m  = (month - 3) % 12 + 1
    yy = month < 3 ? year-1 : year
    y  = yy % 100
    c  = yy / 100
    (d + (2.6 * m - 0.2).floor + y + (y/4.0).floor + (c/4.0).floor - 2*c) % 7
end

def solve
  count = 0
  (1901..2000).each do |y|
    (1..12).each do |m|
      count += 1 if day_of_week(y, m, 1) == 0
    end
  end
  count
end

puts solve
