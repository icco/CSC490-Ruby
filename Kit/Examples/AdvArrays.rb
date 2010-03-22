# Copyright 2010 Software Inventions, Inc
# 1. Heterogenous arrays
# 2. Negative array indexing
# 3. Ranges
# 4. 2-D arrays

a1 = [30, "Hello", [1,2,3]]    # Array element types can vary
puts "size is #{a1.size}"      # Compound elements are still one element
puts "P1: #{a1}"               # Array.to_s relies on element to_s
puts "P2: #{a1[2][1]}"         # works iff a1[2] is indexable
 
puts "P3: #{a1.flatten!}"      # You can "flatten" compound elements

puts "P4: #{a1[-1]} #{a1[-2]}" # Negative indexes go from end

puts "\nVarious subarrays"     # Lots of ways to make subarrays
puts "P5: #{a1[1,3]}"          # Can also do it with an index
puts "P6: #{a1[1..4]}"         # .. or a range (start..end)
puts "P7: #{a1[-4..-1]}"       # .. or index-from-end
puts "P8: #{a1[3, 10]}"        # Over-range index is truncated

a2d = [[1, 2, 3], [4, 5, 6]]   # a 2x3 2-D array, or array of arrays

for row in (0...a2d.size)      # Nested loop to print it
   for col in (0...a2d[row].size)
      print "P10: #{a2d[row][col]} "
   end
   puts
end

# Exercises
#
# 1. Setup up and then print out a 2x3x4 array of integers
#
# 2. Does == work to compare two 2x3x4 arrays?  How, if so?
#
# 3. What does this return, and why?  
# [[1,2], [3], [6]] <=> [[1, 2], [3, 1]]
#
# 4. Fill your array from 1 with 0's using the "fill" method
# from the docs.  Write this so that it will work correctly
# on any non-ragged 3-D array, of any size.  Use just a single
# statement (no loops), though you may have two fill calls in it