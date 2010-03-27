#!/usr/bin/ruby1.8
# Decrypts and stuff
# @author Nathaniel "Nat" Welch

def countLetters file
   count = Hash.new(0)
   ("a".."z").each {|let| count[let] = 0 }
   file.each { |line| line.downcase.split(//).each {|x| count[x.gsub(/\W/,'')] += 1} }
   count.delete("")

   return count.sort {|a, b| 
      c = b[1] <=> a[1]
      if c == 0
         b[0] <=> a[0]
      else
         c 
      end }.map {|k, v| k }.join
end

def replace str, from, to
   if from.length != to.length
      raise Exception.new("Encoding patterns do not match. \n #{from.inspect} \n #{to.inspect}")
   end

   return str.split(//).map {|x|
      if x.match(/\w/)
         i = from.index(x.downcase)
         y = i ? to[i, 1] : x
         x < "a" ? y.capitalize : y
      else
         x
      end
   }.join
end

ARGV.each { |file| 
   f = File.open(file, "r") 
   fc = f.readlines.to_s
   to = "etaoinshrdlcumwfgypbvkjxqz"
   from = countLetters fc # create array with characters sorted by frequency
   input = ""

   begin
      if input != ""
         from = to = ""
         input.downcase.split(" ").each {|x| 
            a, b = x.split(/->/)
            from += a
            to += b
         }

         ofrom = from.to_s
         from += to
         to += ofrom
      end

      fc = replace(fc, from, to) 
      puts fc
      print "Enter command: "
      $stdout.flush

      input = $stdin.gets.chomp
   end while input != "Done"
   f.close()
}

