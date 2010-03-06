# Copyright 2010 Software Inventions, Inc
# 1. String constants
# 2. String methods
# 3. Split operation
# 4. Split/operation/join pattern
# 5. 1-char strings serve as "chars", at least in 1.9 onward

s1 = 'Single quotes don\'t substitute expresions like #{s1}'
s2 = %q|If you don't want to escape a lot of 's or "s, make 'yer own delimiter|
s3 = %Q/With %Q, you can substitute (e.g. #{s1})./ 

puts s1
puts s2
puts s3

puts ("P1: "+s1+"\n"+s2+"\n"+s3) # Strings concatenate witn +
puts("P2: #{s1[2]} #{s1.size}")  # Strings generally work like arrays
puts("P3: #{s1[2].length()}")    # Indexing a string produces a 1-char string
puts("P4: #{s1.slice!(0, 6)}")   # And slice! chops one up, returning part...
puts("P5: #{s1}")                # ... and keeping the rest for later slicing

puts("P6: #{s1.split}")          # But, split is the real power method.
puts("P7: #{s3.split(',')}")     # And, you can choose the delimiter

s1 = STDIN.gets
while (s1 != nil)
   puts s1.split.reverse.join(' ') # split/operation/join is a powerful pattern
   s1 = STDIN.gets
end
