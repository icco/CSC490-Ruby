# Copyright 2010 Software Inventions, Inc
# 1. Variety of conditionals
# 2. Variety of loops
# 3. Constants (as an aside)

i = 10
j = 15

unless i < j        # unless is "if not".  It lets you
   puts "P1: Nope"  # .. put branches in the clearest order
else                # Syntax is just like if-statement.
   puts "P2: Yep"
end

# One-line forms of if and unless
if i < j then puts "P3: Yep" end  # then/end is required
puts "P4: Yep" if i < j

unless i >= j then puts "P5: Yep" end
puts "P6: Yep" unless i >= j

# Eight different ways to loop from FIRST to LAST
FIRST = 0  # Ruby constants, by the way
LAST = 5
FIRST = 1  # Well, sort of constant...

print "P7: "
x = FIRST             # Standard way
while x <= LAST 
   printf "%d ", x
   x += 1
end
puts "(Normal while)"

print "P8: "
x = FIRST             # With while at end, like a "do-while"
begin
   printf "%d ", x
   x += 1
end while x <= LAST   # end and while must be on same line
puts "(Suffix while)"

print "P9: "
x = FIRST
until x > LAST        # With "until" -- like "while not"
   printf "%d ", x
   x += 1
end
puts "(Normal until)"

print "P10: "
x = FIRST             # With until at end.
begin
   printf "%d ", x
   x += 1
end until x > LAST
puts "(Suffix until)"

print "P11: "
x = FIRST             # With endless-loop and a break
loop do
   printf "%d ", x
   x += 1
   break if x > LAST
end
puts "(Loop-break)"

print "P12: "
x = FIRST             # With loop and "Ruby goto" (catch/throw)
catch (:loop_block) do
   loop do
      printf "%d ", x
      x += 1
      throw :loop_block if x > LAST
   end
end
puts "(Loop-catch/throw)"

print "P13: "
x = FIRST-1
printf "%d ", x += 1 while x < LAST  # with one-line form of while
puts "(Single line suffix while)"

print "P14: "
x = FIRST-1
printf "%d ", x += 1 until x >= LAST # with one-line form of until
puts "(Single line suffix until)"

# NOTE: this does not print even one time, even though while is at
# end of line.  It's *not* like a do-while

print "P15: "
printf "%d ", x += 1 while x < LAST
puts "(Single line suffix while -- continuation)"

# Exercises
#
# 1. Write a triply-nested loop that breaks out of all three loops on
# some condition. (There is no multi-loop break; you need to use catch/
# throw.)
#
# 2. Can multiple statements be embedded in a one-line if or unless? 
# Show how if so.