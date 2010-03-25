# Counts words

class CollString < String
   @@lookup = Hash.new(0).merge({
      'w' => 0, 'a' => 1, 'b' => 2, 'q' => 3, 'c' => 4, 'd' => 5, 
      'e' => 6, 'f' => 7, 'g' => 8, 'h' => 9, 'i' => 10, 'j' => 11, 
      'k' => 12, 'l' => 13, 'm' => 14, 'n' => 15, 'o' => 16, 'p' => 17, 
      'r' => 18, 's' => 19, 't' => 20, 'u' => 21, 'v' => 22, 'x' => 23, 
      'y' => 24, 'z' => 25, '1' => 26, '2' => 27, '3' => 28, '4' => 29, 
      '5' => 30, '6' => 31, '7' => 32, '8' => 33, '9' => 34, '0' => 35 
   })

   def <=>(other)
      b = other.to_s.downcase
      a = self.to_s.downcase
      ai = a.split(//).inject(0) {|l,r| l + @@lookup[r]}
      bi = b.split(//).inject(0) {|l,r| l + @@lookup[r]}
      ai <=> bi
   end
end

# Init Hash
h = Hash.new(0)

# For each file
ARGV.each { |file| 
   File.open(file, "r").each { |line|
      line.split(/\W/).each {|word|
         if word.length > 0
            h[CollString.new(word)] = h[word] + 1
         end
     }
   }
}

# sort by value in descending order, then by Key in ascending order, and then
# print it in this sorted order
h.sort{|a,b| c = (b[1] <=> a[1]); if c == 0; a <=> b; else c end }.each { |elem|
  puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
}

