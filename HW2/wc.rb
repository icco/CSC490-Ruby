# Counts words

class CollSring
   include Comparable

   def initialize (str)
      @str = str
   end

   def hash 
      @str.hash
   end

   def eql?(other)
      @str.eql? other
   end

   def <=>(other)
      @str <=> other
   end
end

h = Hash.new(0)
ARGV.each { |file| 
   File.open(file, "r").each { |line|
      line.split.each {|word|
         # Strip away punctuation at beg and end
         word.gsub!(/^[(,$?!\"_\'{}@#|*%+\\=\-\^\<\/>\[\]&;:.)]*/, '')
         word.gsub!(/[(,$?!\"_\'{}@#|*%+\\=\-\^\<\/>\[\]&;:.)]*$/, '')

         if word.length > 1 
            h[word] = h[word] + 1
         end
     }
   }
}

# sort by value in descending order, then by Key in ascending order, and then
# print it in this sorted order
h.sort{|a,b| c = b[1] <=> a[1]; if c == 0; a <=> b; else c end }.each { |elem|
  puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
}

