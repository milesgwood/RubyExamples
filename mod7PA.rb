#Name: Miles Greatwood
#eID: 109312473
#Class CS430 PA7

class Point
  def initialize(x, y)
    @x = x
    @y = y
  end
  attr_accessor :x, :y

  #This overloads the == method for point objects
  def ==(p)
    return (@x == p.x && @y == p.y)
  end

  def sqr_distance(p)
   return (@x - p.x) ** 2 + (@y - p.y) ** 2
  end

  def distance(p)
   return Math.sqrt(sqr_distance(p))
  end

  def turn_directrion(p1, p2)
    0 <=> (p2.x-p1.x)*(@y-p1.y) - (@x-p1.x)*(p2.y-p1.y)
  end

  def to_s
    return "[" + @x.to_s + "," + @y.to_s + "]"
  end
end

class Pair
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end
  attr_accessor :p1, :p2

  # checks to see if the points in the pairs are equal
  def ==(o)
    return (@p1==o.p1 && @p2==o.p2) || (@p2==o.p1 && @p1==o.p2)
  end

  def to_s
    return "(" + @p1.to_s + " " + @p2.to_s + ")"
  end
end

#To make an alias for a class simply set the constant outside of the class
#Here a constant object Edge is set to the class object of Pair type
Edge = Pair

class Point_Set
  def initialize(points = [])
    @points = points
  end

  def size
    return @points.size
  end

  def add(p)
    @points.push(p) unless(@points.include?(p))
  end

  def include?(p)
    @points.include? (p)
  end

  # returns all of the pairs in a new array
  def all_pairs
    points = []
    @points.each_with_index { | point1 , i1 |
      @points.each_with_index { | point2, i2 |
        # puts point1.to_s + " " + point2.to_s if i2 > i1
        points.push(Pair.new(point1, point2)) if i2 > i1
      }
    }
    return points;
  end

  # returns nil or the closest pair of points
  # would be faster to compute all of the sqr distances
  # and then use indexes to return the min pait
  def closest_pair
    if @points.size < 2 then return nil
    else
      closest = @points[0].sqr_distance(@points[1])
      closest_pair = nil

      all_pairs.each{ | pair |
        current_dist = pair.p1.sqr_distance(pair.p2)
        if closest >= current_dist
          closest_pair = pair
          closest = current_dist
        end
      }
      return closest_pair
    end
    end #closest_pair function

  def is_hull_edge(edge)
    turn_vals  = []
    @points.each{|p|
      turn_vals.push(p.turn_directrion(edge.p1, edge.p2))
    }
    return turn_vals.all? {|x| x >= 0} || turn_vals.all? {|x| x <= 0}
  end

  def convex_hull
    if @points.size < 2 then return nil
    else
      hull = []
      all_pairs.each{|x| hull.push(x) if is_hull_edge(x)}
    end
    return hull
  end
end
