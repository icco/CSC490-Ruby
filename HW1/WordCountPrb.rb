h = Hash.new
File.open(ARGV[0], "r").each { |line|
   line.split.each {|word|
      if h.has_key?(word)
         h[word] = h[word] + 1
      else
         h[word] = 1
      end
  }
}

# sort the hash by value, and then print it in this sorted order
h.sort{|a,b| a[1]<=>b[1]}.each { |elem|
  puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
}
