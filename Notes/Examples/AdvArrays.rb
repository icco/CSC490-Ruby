# Copyright 2010 Software Inventions, Inc
# 1. Heterogenous arrays
# 2. Array indexing
# 3. Assignment to/from scalars
# 4. Splat operator
# 5. 2-D arrays

a1 = [30, "Hello", [1,2,3]]    # Array element types can vary
puts "size is #{a1.size}"      # Compound elements are still one element
puts "P1: #{a1}"               # Array.to_s relies on element to_s
puts "P2: #{a1[2][1]}"         # works iff a1[2] is indexable
 
puts "P3: #{a1.flatten!}"      # You can "flatten" compound elements

puts "P4: #{a1[-1]} #{a1[-2]}" # Negative indexes go from end

puts "\nVarious subarrays"     # Lots of ways to make subarrays
puts "P5: #{a1.slice(2,3)}"    # slice method (start, count)
puts "P6: #{a1[1,3]}"          # Can also do it with an index
puts "P7: #{a1[1..4]}"         # .. or a range (start..end)
puts "P8: #{a1[-4..-1]}"       # .. or index-from-end
puts "P9: #{a1[3, 10]}"        # Over-range index is truncated

a2d = [[1, 2, 3], [4, 5, 6]]   # a 2x3 2-dimensional array, or array of arrays

for row in (0...a2d.size)      # Nested loop to print it
   for col in (0...a2d[row].size)
      print "P10: #{a2d[row][col]} "
   end
   puts
end

