# The Book of Ruby - http://www.sapphiresteel.com

STDIN.each {|line| 
   puts line.split.each { |word|
      if /^[^aeiou]/ =~ word
         word.sub!(/^([^aeiou]+)([aeiou].*)$/, '\2\1ay')
      else
         word + 'hay'
      end
   }
}

# Class exercise
# 1. Break each line into words, space delimited, and reassemble
# 2. For each word, check vowel-prefix or not.  Print with X in front if no vowel
# 3. Do RE substitution for 1-consonant prefix words.
# 4. Adjust to words of alphabetics, and allow a single nonalpha surrounded by
#    alphas: e.g. "don't", "big-endian.  Drop the non alphas when translating
# 5. Retain punctuation in output.
