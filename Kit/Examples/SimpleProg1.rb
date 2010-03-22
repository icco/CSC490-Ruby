# Copyright 2010 Software Inventions, Inc
# 1. Variables and assignments
# 2. Function, parameters and return
# 3. for loop, if-statement
# 4. == comparison (deep, not shallow)
# 5. puts/print
# 6. Evaluations w/in strings #{}

def isEven(j)
   return  j%2 == 1   # Try removing the return, and try (j%2).equal?(1)
end   

for i in (1..10)      # From 1 to 10 inclusive. (1...10) is disclusive
   j = i*i
   if isEven(j)       # Try removing the ()
      puts "#{i} squared is odd"
   else
      print "#{i} squared is even\n"
   end
end