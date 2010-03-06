# Copyright 2010 Software Inventions, Inc
# 1. Modules and mixins
# 2. Comparable module
# 3. Reopening a class

# Module to define comparatives.  
module MyComparable
   def <(other)
      (self <=> other) < 0
   end

   def >(other)
      (self <=> other) > 0
   end

   def ==(other)
      (self <=> other) == 0
   end

   def !=(other)
      (self <=> other) != 0
   end
end

# Simple class with <=> operator, and other comparatives
# via MyComparable
class Sample 
   def initialize(x)
      @x = x
   end

   attr_accessor :x

   def <=>(other)
      @x - other.x
   end

   include MyComparable  # automatically does < > == and !=
end

s1 = Sample.new(2)
s2 = Sample.new(4)

puts "P1: Yep" if (s1 <=> s2) < 0 # Works because of <=>
puts "P2: Yep" if s1 < s2         # Works because of MyComparable
puts "P3: Nope" if s1 > s2        # Ditto 

a1 = [1, 2, 3]
a2 = [1, 2, 2, 1]

puts "P4: Yep" if (a1 <=> a2) > 0  # Using < won't compile

class MyArray < Array
   def <=>(other)
      length - other.length
   end

   include Comparable  # Like MyComparable, but built in
end

a3 = MyArray.new.push(1).push(2).push(3)
a4 = MyArray.new.push(1).push(2).push(2).push(1)

puts "P5: Yep" if a3 < a4  # Works, and compares on length alone

def a3.<=>(other)          # Just a3 gets a different <=>
   other.length - length   # .. via singleton method
end

puts "P6: Yep" if a3 > a4  # OK, now the rule works the other way
puts "P7: Yep" if a4 > a3  # WTH?  Why is this so?



