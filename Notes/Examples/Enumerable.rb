# Copyright 2010 Software Inventions, Inc
# 1. Enumerable interface
# 2. Dynamic allocation
# 3. Internal vs external iterators

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
   printf "%d ", i
end

# Try out methods provided by Enumerable
puts "\nMax is: #{list.max}  Min is: #{list.min} Count is: #{list.count}"

# Since enumeration is done by "each" calls and yields,
# you get "external iterator" semantics.

for i in list
   for j in list
      printf "%d x %d ", i, j
   end
end

