# Copyright 2010 Software Inventions, Inc.
# 1. Noninheritance of member and class instance data.
# 2. Class declarations as code.
# 3. instance_vars method

class Point
   @@allPts = []          # Class member
   @classX = 42           # Class instance. Creates Point.@x different from @x

   def initialize(x, y)
      @x, @y = x, y       # Create @x and @y member data and initialize them
   end
   
   attr_accessor "x", "y"

   def to_s
      "(#{@x}, #{@y})"
   end

   def Point.numPts       # Class method (aka "static" method in Java/C#/C++)
      @@allPts.size
   end

   def Point.printAll
      puts @@allPts.join(" ")
   end

   def Point.printClassX
      puts @classX
   end
end

class Point3D < Point
   def initialize(x, y, z)
      @z = z
   end

   attr_accessor :z  # Using symbol variable instead of "z"

   def to_s
      "(#{@x}, #{@y}, #{@z})"  
   end      
end

pt1 = Point.new(1, 2)

class Point               # Oops, I forgot something
   def initialize(x, y)
      @x, @y = x, y       # Create @x and @y member data and initialize them
      @@allPts.push(self) # "self" is the same as "this" in Java/C#
   end
end

pt2 = Point.new(3, 4)
print "There are #{Point.numPts} points total\n"
Point.printAll

class Point               # Damn, did I remember to initialize allPts?
    @@allPts = []
end
print "There are #{Point.numPts} points total\n"

pt3 = Point3D.new(6, 7, 8)

class Point3D < Point     # Forgot the super call and I want classX to be 43
   @classX = 43

   def initialize(x, y, z)
      super(x, y)
      @z = z
   end
end

Point.printClassX         # Wait, shouldn't this be 43 now?
Point3D.printClassX       # Same method as Point, but different classX!

pt4 = Point3D.new(9, 10, 11)
print "pt3 has these members: #{pt3.instance_variables}" 
print " while pt4 has these: #{pt4.instance_variables}\n"

print "There are #{Point.numPts} points total\n"
Point.printAll            # Only pt 4 actually makes it onto allPts

