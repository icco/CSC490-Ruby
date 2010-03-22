# Copyright 2010 Software Inventions, Inc
# 1. attr_accessor and attr_reader
# 2. to_s and method overloading
# 3. Inheritance, and super

class Point
   def initialize(x, y)
      @x, @y = x, y   #Create @x and @y member data and initialize them
   end
   
   attr_accessor "x", "y"

   def to_s
      "#{@x}, #{@y}"
   end
end

class Point3D < Point
   def initialize(x, y, z)
      super(x, y)
      @z = z
   end

   attr_accessor :z  # Using symbol variable instead of "z"

   def to_s
      super() + ", #{@z}"  
   end      
end

pt1 = Point.new(1, 2)
pt2 = Point3D.new(3, 4, 5)

print "Point 1 is (#{pt1})\n"
print "Point 2 is (#{pt2})\n"
