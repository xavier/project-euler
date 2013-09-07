"""
Problem 39: Integer right triangles

If p is the perimeter of a right angle triangle with integral length
sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
"""

require "set"

squares = (1...1000).map { |x| x*x }

solutions = {}

def pythagoreans_triplets(limit)
  Enumerator.new do |enum|
    (1..limit).each do |a|
      a2 = a*a
      (1..limit).each do |b|
        b2 = b*b
        a_b = a+b
        a2_b2 = a2+b2
        (1..(limit-a_b)).each do |c|
          c2 = c*c
          if c2 == a2_b2
            enum.yield c+a_b, [a, b, c].sort
          end
        end
      end
    end
  end.lazy
end


pythagoreans_triplets(1000).each do |p, triplet|
  solutions[p] ||= Set.new
  solutions[p] << triplet
end

raise "Wrong!" unless solutions[120] == Set.new([[20,48,52], [24,45,51], [30,40,50]])

best_p, best_triplets = 0, []
solutions.each do |p, triplets|
  if triplets.size > best_triplets.size
    best_p, best_triplets = p, triplets
  end
end

puts "P=#{best_p} => #{best_triplets.inspect}"