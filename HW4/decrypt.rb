#!/usr/bin/ruby1.8
# Decrypts an stuff

# For each file
ARGV.each { |file| 
   File.open(file, "r").each { |line|
      puts line
   }
}

