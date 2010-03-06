# Copyright 2010 Software Inventions, Inc
# 1. Variety of conditionals
# 2. Variety of loops

i = 10
j = 15

unless i < j        # unless is "if not".  It lets you
   puts "P5: Nope"  # .. put branches in the clearest order
else                # Syntax is just like if-statement.
   puts "P6: Yep"
end

# One-line forms of if and unless
if i < j then puts "P1: Yep" end  # then/end is required
puts "P2: Yep" if i < j

unless i >= j then puts "P3: Yep" end
puts "P4: Yep" unless i >= j

# Eight different ways to loop from FIRST to LAST

FIRST = 0  # Ruby constants
LAST = 5
FIRST = 1  # Well, sort of constant...

x = FIRST             # Standard way
while x <= LAST 
   printf "%d ", x
   x += 1
end
puts "(Normal while)"

x = FIRST             # With while at end, like a "do-while"
begin
   printf "%d ", x
   x += 1
end while x <= LAST   # end and while must be on same line
puts "(Suffix while)"

x = FIRST
until x > LAST        # With "until" -- like "while not"
   printf "%d ", x
   x += 1
end
puts "(Normal until)"

x = FIRST             # With until at end.
begin
   printf "%d ", x
   x += 1
end until x > LAST
puts "(Suffix until)"

x = FIRST             # With endless-loop and a break
loop do
   printf "%d ", x
   x += 1
   break if x > LAST
end
puts "(Loop-break)"

x = FIRST             # With loop and "Ruby goto" (catch/throw)
catch (:loop_block) do
   loop do
      printf "%d ", x
      x += 1
      throw :loop_block if x > LAST
   end
end
puts "(Loop-catch/throw)"

x = FIRST-1
printf "%d ", x += 1 while x < LAST  # with one-line form of while
puts "(Single line suffix while)"

x = FIRST-1
printf "%d ", x += 1 until x >= LAST # with one-line form of until
puts "(Single line suffix until)"

# NOTE: this does not print even one time, even though while is at
# end of line.  It's *not* like a do-while

printf "%d ", x += 1 while x < LAST
puts "(Single line suffix while -- continuation)"