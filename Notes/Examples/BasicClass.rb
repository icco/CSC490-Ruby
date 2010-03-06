# Copyright 2010 Software Inventions, Inc
# 1. Basic class declaration
# 2. Constructor "initialize" and the "new" method
# 3. Member data
# 4. Attributes via overloading

class Point
   def initialize(x, y)
      @x, @y = x, y   #Create @x and @y member data and initialize them
   end
   
   def x()
      @x
   end

   def y()
      @y
   end

   def x=(val)
      @x = val
   end

   def y=(val)
      @y = val
   end
end

pt1 = Point.new(1, 2)
pt2 = Point.new(3, 4)

pt1.x=(pt1.x() + 10)
pt1.y= pt1.y() + 10
pt2.x = pt2.x + 10
pt2.y += 10

print "Point 1 is #{pt1.x}, #{pt1.y}\n"
print "Point 2 is #{pt2.x}, #{pt2.y}\n"
print "Point 1 via to_s is #{pt1}\n"
