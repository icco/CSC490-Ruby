#!/usr/bin/ruby1.8
# Decrypts and stuff
# @author Nathaniel "Nat" Welch

def countLetters file
   count = Hash.new(0)
   file.each { |line| line.downcase.split(//).each {|x| count[x.gsub(/\W/,'')] += 1} }
   count.delete("")

   return count.sort {|a, b| b[1] <=> a[1] }.map { |k, v| k }.join
end

def replace str, from, to
   if from.length != to.length
      raise Exception.new("encoding patterns do not match.")
   end

   return str.split(//).map {|x|
      if x.match(/\w/)
         i = from.index(x.downcase)
         y = to[i, 1]
         x < "a" ? y.capitalize : y
      else
         x
      end
   }.join
end

ARGV.each { |file| 
   fc = File.open(file, "r").readlines.to_s
   to = "etaoinshrdlcumwfgypbvkjxqz"
   from = countLetters fc # create array with characters sorted by frequency
   puts fc
   puts replace(fc, from, to)

}

