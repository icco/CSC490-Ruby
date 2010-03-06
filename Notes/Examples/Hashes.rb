# Copyright 2010 Software Inventions, Inc
# 1. Hash table

h1 = Hash.new("default")      # Default is nil if you don't specify

h1["alpha"] = "beta"          # Index by hash key
puts "P1: #{h1["alpha"]}"     # Retrieve by key
puts "P2: #{h1["gamma"]}"     # Gets default val
h1[1] = 2.0                   # Any key and val type OK, even mixed
h1[[1,2]] = [3,4]             # .. even compound

if h1.has_key?([1,2])         # Check for key presence 
   puts "P3: #{h1[1]}"
   puts "P4: #{h1[[1,2]][0]}" 
end

puts "P5: #{h1.inspect}"      # Inspect dumps the contents as a string

h2 = {                        # Sets up h2 the same as h1
   "alpha" => "beta",
   [1,2] => [3,4],
   1 => 2.0
}

if h1 == h2 && !h1.equal?(h2) # Same contents but not same object
   puts "P6: Yep"
end

# Can dump keys and values as arrays
puts "P7: Keys #{h1.keys}  Values #{h1.values}"

# Hashes of hashes are especially powerful.  This one keys by
# dept, and then employee last name, providing id number

depts = {
   "CSC" => {"Staley" => 1234, "Bellardo" => 5678},
   "EE"  => {"Niku" => 3675, "Breitenbach" => 8765}
}

depts.default = {}                   # Can set default post facto

puts "P8: #{depts["CSC"]["Staley"]}"

depts["Math"]["Jones"] = 3456        # Adds to default empty hash
puts "P9: #{depts["Math"]["Jones"]}"

# For-loops work on hashes, giving a series of [key, value] arrays

for dEntry in depts
   puts "P10: Dept #{dEntry[0]}"
   for nEntry in dEntry[1]
      puts "P11: #{nEntry[0]} has id #{nEntry[1]}"
   end
end


# So, what if I make a new class and use it as a key?
class MyKey
   def initialize(val)
      @val = val
   end

   attr_accessor :val
end

h3 = Hash.new("default")

k1 = MyKey.new("alpha")
k2 = MyKey.new("alpha")

h3[k1] = "beta"
puts "P12: #{h3[k2]}"   # WTH? Gets default

class MyKey   # OK, let's add a little more to MyKey
   def hash
      @val.hash
   end

   def eql?(other)
      @val.eql?(other.val)
   end
end

h3 = Hash.new("default")  # Start over from scratch
k1 = MyKey.new("alpha")   # .. (why start over, btw?)
k2 = MyKey.new("alpha")

h3[k1] = "beta"
puts "P13: #{h3[k2]}"      # Ah.  Now it works.
