# Copyright 2010 Software Inventions, Inc
# Concepts
# Array to scalar assignment and vice versa
# Splat operator
# Array <-> scalar parameters and returns

a1 = [1, 2, 3]
x, y, z = a1                      # Can assign to/from scalars
puts "P1: #{a1} | #{x},#{y},#{z}" 

a2 = x, y, z                      # Works from scalar to array, too
u, v = a1                         # Uses only as many elements as needed
puts "P2: #{a2} | #{u}, #{v}" 

x, y, z = z, x, y                 # Don't even need an intervening array
puts "P3: #{x} #{y} #{z}"

u, *v = a1                        # "splat" operator -- a cue for grouping
puts "P4: #{a1} | #{u}, #{v}"

a3 = a1, a2                       
a4 = *a1, *a2                     # ... or for "ungrouping"
puts "P5: #{a3} vs #{a4}" 

def getMinMaxAve(*vals)
   total = 0
   for i in vals
      total += i
   end
   return vals.min, vals.max, total/vals.count
end

result = getMinMaxAve(4, 42, -1)  # Array<->scalars works on call/return
min, max = getMinMaxAve(14, 12, 9, 17)

puts "P6: #{result}, #{min}, #{max}"

res2 = getMinMaxAve(3, 4, *result)  # Splat to "unpack" as well as pack
puts "P7: #{res2}"

# Exercises
#
# 1. Rewrite a.push(3) using only assignment, comma, and splat.
# 2. Write an appropriate "def" line, with parameters, for printf.