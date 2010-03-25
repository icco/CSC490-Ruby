# Counts words

class CollString < String
   @@lookup = Hash.new(0).merge({
      'W' => 0,   'w' => 1, 'A' => 2,   'a' => 3, 'B' => 4,   'b' => 5, 'Q' =>
      6,   'q' => 7, 'C' => 8,   'c' => 9, 'D' => 10,  'd' => 11, 'E' => 12,
         'e' => 13, 'F' => 14,  'f' => 15, 'G' => 16,  'g' => 17, 'H' => 18,
         'h' => 19, 'I' => 20,  'i' => 21,   'J' => 22,  'j' => 23,   'K' =>
      24,  'k' => 25,   'L' => 26,  'l' => 27,   'M' => 28,  'm' => 29,   'N'
      => 30,  'n' => 31,   'O' => 32,  'o' => 33,   'P' => 34,  'p' => 35,
         'R' => 36,  'r' => 37,   'S' => 38,  's' => 39,   'T' => 40,  't' =>
      41,   'U' => 42,  'u' => 43,   'V' => 44,  'v' => 45,   'X' => 46,  'x'
      => 47,   'Y' => 48,  'y' => 49,   'Z' => 50,  'z' => 51,   '1' => 52, '2'
      => 53, '3' => 54, '4' => 55, '5' => 56, '6' => 57, '7' => 58, '8' => 59,
         '9' => 60, '0' => 61 
   })

   def <=>(other)
      a = self.to_s
      b = other.to_s

      aa = a.split(//).map {|x| @@lookup[x]}
      ba = b.split(//).map {|x| @@lookup[x]}

      for i in 0...aa.length
         if aa[i] == ba[i]
            aa.delete_at(i)
            ba.delete_at(i)
         else
            break
         end
      end

      aa <=> ba
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
h.sort{|a,b| c = (b[1] <=> a[1]); c == 0 ? a <=> b : c}.each { |elem|
   puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
}

