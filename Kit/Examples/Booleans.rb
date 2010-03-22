# Copyright 2010 Software Inventions, Inc
# 1. Logical testing and nil or false as "false"
# 2. <=> operator
# 3. Comparable module
# 4. Array <=>

i = 1
j = 2
k = 3
w = [1, 2, 3, 1]
x = [1, 2, 3]
y = [1, 2, 3]
z = [1, 2, 1]

if i == 1 && k < 4 || j != 2 # Usual ands and ors
   puts "P1: Yep"
end

b1 = i < 1               # Also boolean values .. 
puts "P2: #{b1} #{1==1}" # .. "true" and "false"
puts "P3: #{true.class}" # What kind of thing are they?

if [1,2][3]              # nil is another kind of "false"
   puts "P4: Nope"
elsif [1,2][3] == nil    # Can check for nil value.
   puts "P5: Yep"
end

if 0                     # C programmers, note
   puts "P6: 0 is TRUE!" # Only "false" and "nil" are false
end

if x == y                # Array equality check works!
   puts "P7: Yep"        # .. and does deep (value) compare
end

if x.equal?(y)           # equal? checks refs, not values
   puts "P8: Nope"       # .. just the opposite of Java
elsif x.equal?(x)
   puts "P9: Yep"
end

puts "P10: #{i <=> j}"    # <=> works like Java compareTo
puts "P11: #{x <=> z}"   # .. even on arrays, where it does
puts "P12: #{x <=> w}"   # .. lexicographic comparison

if i == 1 or             # True
 j == 2 and k < 2        # False, taken as a single clause
   puts "P13: Nope"      # .. but OR and AND have same precedence!
end

# Exercise Questions
# 1. What methods do TrueClass and FalseClass have, and why?
# 2. What array value is less than all other possible values?
# 3. Does <=> work with boolean values?  With strings?

