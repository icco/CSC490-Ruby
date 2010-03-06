# Copyright 2010 Software Inventions, Inc
# 1. Ranges, of varying types
# 2. Range inclusion testing
# 3. Ranges -> arrays
# 4. Range array indexing
# 5. Ranges equality checking rules

r1 = (2..10)
r2 = (2...11)      # Same range as (1..10)
r3 = ('a'..'e')    # Works for chars, too
r4 = ('ab'..'be')  # Even strings
r5 = (1.0 .. 2.0)  # Even floats

puts "P1: #{r1}, #{r2}, #{r3}"

print "P2: "
for i in r1              # for-loops are governed by ranges
   print " #{i}"
end
puts

if r1.include?(9)        # or member? or cover? (typical Ruby)
   puts "P3: #{r1.to_a}" # You can even make them into arrays
   puts "P4: #{r4.to_a}" # .. but watch out if you do it on strings
   # puts "#{r5.to_a}" .. and it's not allowed for floating pt
end

str1 = "Hello, this is a test"
a1 = (100..200).to_a

puts "P5: #{a1[3..8]}"   # Indexing by ranges gets subarrays
puts "P6: #{str1[r1]}"   # ... or substrings
puts "P7: #{a1[-5..-1]}" # Even works with from-end indexes

if r1 == (2..10)         # Equality is literal
   puts "Equal"
end

if r1 == r2              # Not based on the actual range
   puts "NOPE"
end
