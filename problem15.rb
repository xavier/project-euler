"""
Problem 15: Lattice paths

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

  *******     ****--+     ****--+
  |  |  *     |  *  |     |  *  |
  +--+--*     +--****     +--*--+
  |  |  *     |  |  *     |  *  |
  +--+--V     +--+--V     +--***>

  *--+--+     *--+--+     *--+--+
  *  |  |     *  |  |     *  |  |
  *******     ****--+     *--+--+
  |  |  *     |  *  |     *  |  |
  +--+--V     +--***>     ******>

How many such routes are there through a 20×20 grid?

"""

class RoutesCounter

  def initialize(grid_size)
    @grid_size = grid_size
    @routes_in_block = {}
  end

  def count
    count_routes(0, 0)
  end

  def count_routes(x, y)
    if x == @grid_size && y == @grid_size
      routes = 1
    else
      block = [@grid_size-x, @grid_size-y]
      routes = @routes_in_block[block]
      unless routes
        routes = 0
        routes += count_routes(x+1, y) if x < @grid_size
        routes += count_routes(x, y+1) if y < @grid_size
      end
      @routes_in_block[block] = routes
    end
    routes
  end

end

raise "Wrong!" unless RoutesCounter.new(2).count == 6

puts RoutesCounter.new(20).count
