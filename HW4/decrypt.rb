# Counts words

class CollString < String
   @@lookup = "_AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890"

   def <=>(other)
      a = self.to_s
      b = other.to_s

      for i in 0..a.length
         ai = a.length <= 0 ? -100 : @@lookup.index(a[0])
         bi = b.length <= 0 ? -100 : @@lookup.index(b[0])
         if ai == bi
            a = a.reverse.chop.reverse
            b = b.reverse.chop.reverse
         else
            break
         end
      end

      ai <=> bi
   end
end

class MyHash < Hash
   def <=>(other)
      a = self.keys.sort
      b = other.keys.sort
      a <=> b
   end
end

# Init Hash
h = MyHash.new()

# For each file
ARGV.each { |file| 
   linec = 0
   File.open(file, "r").each { |line|
      linec += 1
      line.split(/\W/).each {|word|
         key = CollString.new(word)
         if word.length > 0
            if !h.key? key
               h[key] = MyHash.new()
            end

            if !h[key].key? file
               h[key][file] = [];
            end
               
            h[key][file].push(linec)
         end
      }
   }
}

# sort by value in descending order, then by Key in ascending order, and then
# print it in this sorted order
h.sort.each { |name, files|
   puts "For #{name}:"
   files.each { |fname, lines|
      puts "   (#{fname}) #{lines.uniq.join(", ")}" 
   }
}

