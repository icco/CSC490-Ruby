# Copyright 2010 Software Inventions, Inc
# 1. Basic arrays and initialization
# 2. Array methods, dynamic sizing
# 3. Self-modifying and non-self-modifying methods
# 4. Nil on out-of-range index
# 5. Join
# 6. Method chaining

a1 = [30, 20, 10]            # Create an Array object
puts "array of #{a1.length}" # Length method like Java or C#
puts "P1: #{a1}"             # arrays got their own to_s -- convenient

a2 = a1                      # Shallow copy
a3 = a1.clone                # Deep copy
a1.push(0)                   # eh, we need one more
puts "P2: #{a1}"             # .. so now it has one more
puts ".. of #{a1.size}"      # size is the same as length (typical Ruby)

a1.delete_at(2)              # Array is really like Java ArrayList
puts "P3: #{a1}"
puts "P4: #{a1[0]} #{a1[1]}" # .. but you can index it, too

a1.push(1).push(2).push(42)  # A lot of operations *chain*
puts "P5: #{a1}"             # a1 is changed
puts "P6: #{a2}"             # .. as is a2, since it's the same object
puts "P7: #{a3}"             # but, a3 is still a clone of the original

a2 = a1.sort                 # Lots of other useful methods, too
puts "P8: #{a2}"

puts "P9: #{a1}"             # Some leave the original aay unchanged
a1.sort!                     # ... and some change it in place
puts "P10: #{a1}"            # *Sometimes*, the "!" is a clue

a2 = a1.reverse!.slice!(0,3) # Flip a1, cut off the first 3 elements
a1.concat(a2.reverse)        # Flip the first 3 back, and add to the end
puts "P11: #{a1} #{a2}"      # ... why isn't a2 reversed??

puts "P12: #{a1[100]}"       # Out of range produces nil, not a runtime fault

puts "\nA few join examples"
str = a1.join(" ")           # Join each element's to_s into a big string
puts str                     # Not the same as puts a1 -- this is a string
puts a1.join(" plus ")       # Pick any separator you like
puts a1.join                 # .. or none at all

# READ THE ARRAY DOCS so you know what's available to use


