# Copyright 2010 Software Inventions, Inc.
# 1. Singleton methods, new and redefined
# 2. Class member data, and class instance data
# 3. Concept of "receiver" and self parameter

class Point
   @@allPts = []       # Class member
   @x = 42             # Class instance. Creates Point.@x different from @x

   def initialize(x, y)
      @x, @y = x, y       # Create @x and @y member data and initialize them
      @@allPts.push(self) # "self" points to receiver, like "this" in Java/C#
   end
   
   attr_accessor "x", "y"

   def to_s
      "(#{@x}, #{@y})"
   end

   # Class method (aka "static" method in Java/C#/C++)
   def Point.numPts      
      puts "Numpts1: WTH? #{@x}"      # Point.@x is not member datum @x
      puts "NumPts2: self is #{self}"
      @@allPts.size
   end

   def Point.printAll
      puts @@allPts.join(" ")
   end
end

class Point3D < Point
   @@all3DPts = []  # allPts would clash with Point.allPts

   def initialize(x, y, z)
      super(x, y)
      @z = z
      @@all3DPts.push(self)
   end

   attr_accessor :z  # Using symbol variable instead of "z"

   def to_s
      "(#{@x}, #{@y}, #{@z})"  
   end      

   def Point3D.printAll
      puts @@all3DPts.join(" ")
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

print "P1: Point 1 is #{pt1}\n"
print "P2: Point 2 is #{pt2}\n"
print "P3: Point 3 is #{pt3}\n\n"
print "P4: There are #{Point.numPts} points total\n"
puts  "P5: #{pt1.class == Point} #{pt2.class == Point}"
puts  "P6: #{pt3.class == Point3D}"

Point.printAll
Point3D.printAll

# Exercises
#
# 1. Write a method that adjusts the @x value of all existing points by
# subtracting 1 from each.
#
# 2. Write an x= method that lets you modify Point.@x (the one with the 42
# in it.  Use this in the main to change Point.@x to 41
#
# 3. Write a "purePrintAll" for Point that prints *only* objects that are
# simple Points, not Point3D or anything else derived.
#
# 4. Would we be able to add Point3D's to Point.allPts if Point3D did not
# derive from Point?
