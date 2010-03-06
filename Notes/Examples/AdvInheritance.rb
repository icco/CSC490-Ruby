# Copyright 2010 Software Inventions, Inc.
# 1. Singleton methods, new and redefined
# 2. Class member data, and class instance data
# 3. Concept of "receiver" and self parameter

class Point
   @@allPts = []          # Class member
   @x = 42                # Class instance. Creates Point.@x different from @x

   def initialize(x, y)
      @x, @y = x, y       # Create @x and @y member data and initialize them
      @@allPts.push(self) # "self" points to receiver, like "this" in Java/C#
   end
   
   attr_accessor "x", "y"

   def to_s
      "(#{@x}, #{@y})"
   end

   def Point.numPts       # Class method (aka "static" method in Java/C#/C++)
      puts "WTH? #{@x}"   # Point.@x is not the same as member datum @x
      puts "self is #{self}"
      @@allPts.size
   end

   def Point.printAll
      puts @@allPts.join(" ")
   end
end

class Point3D < Point
   def initialize(x, y, z)
      super(x, y)
      @z = z
   end

   attr_accessor :z  # Using symbol variable instead of "z"

   def to_s
      "(#{@x}, #{@y}, #{@z})"  
   end      
end

pt1 = Point.new(1, 2)
pt2 = Point3D.new(3, 4, 5)
pt3 = Point3D.new(10, 11, 12)

pt2.z = 6

def pt2.z=(val)
end

pt2.z = 7

def pt3.to_s
   "None of your business"
end

print "Point 1 is #{pt1}\n"
print "Point 2 is #{pt2}\n"
print "Point 3 is #{pt3}\n"
print "There are #{Point.numPts} points total\n"
Point.printAll