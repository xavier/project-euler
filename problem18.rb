REQUIREMENTS = """
Problem 18: Maximum path sum I

By starting at the top of the triangle below and moving to adjacent numbers on the row below,
the maximum total from top to bottom is 23.

<triangle1>

        3
       7 4
      2 4 6
     8 5 9 3

</triangle1>

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

<triangle2>

                  75
                 95 64
                17 47 82
               18 35 87 10
              20 04 82 47 65
             19 01 23 75 03 34
            88 02 77 73 07 63 67
           99 65 04 28 06 16 70 92
          41 41 26 56 83 40 80 70 33
         41 48 72 33 47 32 37 16 94 29
        53 71 44 65 25 43 91 52 97 51 14
       70 11 33 28 77 73 17 78 39 68 17 57
      91 71 52 38 17 14 91 43 58 50 27 29 48
    63 66 04 68 89 53 67 30 73 16 69 87 40 31
   04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

</triangle2>

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved
by brute force, and requires a clever method! ;o)
"""

def parse_triangle(name)
  REQUIREMENTS =~ /<#{name}>([^<]+)<\/#{name}>/m
  $1.strip.split("\n").map { |line| line.scan(/\d+/).map(&:to_i) }
end

triangle1 = parse_triangle(:triangle1)
triangle2 = parse_triangle(:triangle2)
triangle3 = [
   [1],
  [0, 1],
[99, 1, 2],
]

puts triangle1.inspect

def find_maximum_path(triangle, current_row = 0, current_pos = 0)
  row_below = current_row+1
  if row_below < triangle.size
    triangle[current_row][current_pos] + [
      find_maximum_path(triangle, row_below, current_pos),
      find_maximum_path(triangle, row_below, current_pos+1)
    ].max
  else
    triangle[current_row][current_pos]
  end
end

triangle3 = [
[1],
[0, 1],
[99, 1, 2],
]

puts find_maximum_path(triangle1)
puts find_maximum_path(triangle2)
puts find_maximum_path(triangle3)