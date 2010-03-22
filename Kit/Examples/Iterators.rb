# Copyright 2010 Software Inventions, Inc
# 1. Blocks and yield
# 2. Array.each and for-loops
# 3. Multiparameter blocks
# 4. Blocks and hashes, ranges, arrays

class BlockUser
   def initialize(count)
      @count = count
   end

   def each
      for i in (1..@count)
         yield i          # Quasi function call on associated block
      end
   end

   def gather
      total = 0
      for i in (1..@count)
         total += yield i
      end
      total
   end
end

bu = BlockUser.new(5)

bu.each {|x|
   puts "P1: Each call: #{x}"
}

print "P2: Sum of squares: "
puts bu.gather{ |x|
   x*x
}

for i in bu  # becomes bu.each {|i| loop body}
   puts "P3: #{i}"
end

# In fact, that's all a for loop ever does
# for i in (1..5) translates to....

(1..5).each do |i|    # Optionally using do/end instead of {}
   puts "P4: #{i}"
end

# Arrays, hashes, and ranges have lots of yield-ing methods
# .. including of course "each" for use in for-loops

a1 = [10, 40, 20, 50, 30]

a1.map!{|x| x*x}         # Replace each element with value returned by block
puts "P5 Mapped: #{a1}"  # .. "collect!" is a synonym.  ! modifies original

puts "P6: #{a1.sort{|x, y| x <=> y}}" # 2-param block, returning sort order
puts "P7: #{a1.sort{|x, y| y <=> x}}" # Reverse sort
puts "P8: #{a1}"                      # a1 unchanged by sort (not sort!)

# Sequences of split/iterate/join can be quite powerful
puts "P9" + "Hello this is a test".split.map{|x| x.reverse}.join(" ")

h1 = {"alpha" => "pi", "gamma" => "delta"}
for pair in h1
   puts "P9: #{pair}"  # Hash.each gives 2-element key/value arrays
end

# Hash.sort gives a pair of 2-element key/values to sort, and
# .. produces an *array* (not Hash) of the sorted pairs
puts "P10: #{h1.sort{|x, y| x[1] <=> y[1]}}"


# Exercises
#
# 1. Rewrite the P3 loop using bu.each, instead of for, and try it out.
#
# 2. Write a single line that prints the number of even elements in an
# array of integers.
#
# 3. Write another single line that deletes all the odd elements from the
# array