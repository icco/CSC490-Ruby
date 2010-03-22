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
   puts "Each call: #{x}"
}

print "Sum of squares: "
puts bu.gather{ |x|
   x*x
}

for i in bu  # becomes bu.each {|i| loop body}
   puts "Loop 1: #{i}"
end

# In fact, that's all a for loop ever does
# for i in (1..5) translates to....

(1..5).each do |i|      # Also using do/end instead of {}
   puts "Loop 2: #{i}"
end

# Arrays, hashes, and ranges have lots of yield-ing methods
# .. including of course "each" for use in for-loops

a1 = [10, 40, 20, 50, 30]

a1.map!{|x| x*x}      # Replace each element with value returned from block
puts "Mapped: #{a1}"  # .. "collect!" is a synonym.  ! modifies original

puts "Sort 1 #{a1.sort{|x, y| x <=> y}}" # 2-parameter block, returning sort order
puts "Sort 2 #{a1.sort{|x, y| y <=> x}}" # Reverse sort
puts "Original #{a1}"                    # a1 unchanged, since we did sort, not sort!

# Sequences of split/iterate/join can be quite powerful
puts "Hello this is a test".split.map{|x| x.reverse}.join(" ")

h1 = {"alpha" => "pi", "gamma" => "delta"}
for pair in h1
   puts "#{pair}"  # Hash.each gives 2-element key/value arrays
end

# Hash.sort gives a pair of 2-element key/values to sort, and
# .. produces an *array* (not Hash) of the sorted pairs
puts "#{h1.sort{|x, y| x[1] <=> y[1]}}"

# You can even nest them

