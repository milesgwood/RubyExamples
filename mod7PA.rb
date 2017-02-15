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
   return Math.sqr(@x - p.x) + Math.sqr(@y - p.y)
  end

  def distance(p)
   return Math.sqrt(sqr_distance(p))
  end   

  def turn_directrion(p1, p2)
    0 <=> (p2.x-p1.x)*(@y-p1.y) - (@x-p1.x)*(p2.y-p1.y)
  end
end

