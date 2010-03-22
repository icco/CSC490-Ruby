# Copyright 2010 Software Inventions, Inc
# 1. Enumerable interface
# 2. Dynamic allocation
# 3. Nested classes
# 4. Internal vs external iterators

class MyList
   class Node
      def initialize(data, nextPt)
         @data = data
         @nextPt = nextPt
      end
      
      attr_accessor :data, :nextPt
   end

   include Enumerable

   def initialize
      @head = nil
   end

   def add(data)
      @head = Node.new(data, @head)
      self
   end

   def each
      temp = @head
      while temp != nil
         yield temp.data
         temp = temp.nextPt
      end
   end
end

list = MyList.new
list.add(10).add(20).add(30)

for i in list
   printf "P1: %d ", i
end

# Try out methods provided by Enumerable
puts "\nMax is: #{list.max}  Min is: #{list.min} Count is: #{list.count}"

# Since enumeration is done by "each" calls and yields,
# you get "external iterator" semantics.
for i in list
   for j in list
      printf "P2: %d x %d ", i, j
   end
   puts
end

# Exercises
#
# 1. Rewrite the final nested loop using direct "each" calls instead of
# for's.  Note that the result is a set of recursive each calls.
#
# 2. Write code that is equivalent to Java's "toArray" method -- taking
# a list and returning an array with equivalent content.  Use one short line.
#
# 3. Write code that prints the items in "list" with position numbers before
# them:  
#
# 1. 30
# 2. 20
# 3. 10
#
# Use at most one short (60 chars or less) line of code.