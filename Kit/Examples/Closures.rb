# Copyright 2010 Software Inventions, Inc
# Concepts
# 1. Closures
# 2. Parameters of closures
# 3. General behavior of closures wrt various scope variables

class Sample
   @@cVar = 0
 
   def initialize(name)
      @name = name
      @counter = 0
   end

   attr_accessor :counter, :name

   def getClosure
      localVar = 0

      return lambda { |x| # or return proc { ... 
         @@cVar += 1
         @counter += 1
         localVar += x

         puts "#{@name} #{@@cVar} #{@counter} #{localVar}"
      }
   end
 def callClosure(cls)
   cls.call  1
 end
end

s1 = Sample.new("Sample1")
s2 = Sample.new("Sample2")

c1 = s1.getClosure
c1.call 1                 #  Sample1  1  1  1
c1.call 2                 #  Sample1  2  2  3
c1a = s1.getClosure
c1a.call 1                #  Sample1  3  3  1
c1.call  1                #  Sample1  4  4  4

c2 = s2.getClosure
c2.call  1                #  Sample2  5  1  1
c1a.call 2                #  Sample1  6  5  3

s1 = Sample.new("Sample3") 
c3 = s1.getClosure
c3.call 1                 #  Sample3  7  1  1
c2.call 1                 #  Sample2  8  2  2
c1.call 1                 #  Sample1  9  6  5

Sample.new("Sample4").getClosure.call 1  #  Sample4  10  1  1
s1.callClosure(c2)

# Exercises
#
# 1. Say I add a method to Sample thus:
#
# def callClosure(cls)
#   cls.call  1
# end
#
# If I call this as follows s1.callClosure(c2), what 
# happens?  Whose member data is incremented, and why?
