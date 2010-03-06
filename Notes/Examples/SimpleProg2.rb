# Copyright 2010 Software Inventions, Inc
# 1. STDIN
# 2. Type conversion
# 3. Syntax pickiness
# 4. printf
# 5. Method calls, String.chomp

begin
   line = STDIN.gets
   if line != nil
      line.chomp!                       # Try removing this
      printf("Entered: %s ", line)
      val = line.to_i                   # Try omitting this
      printf("Square is %d\n", val*val) # Try line*line
   end
end while line != nil # != nil          # Try breaking "while" onto next line
