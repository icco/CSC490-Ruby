# Copyright 2010 Software Inventions, Inc
# 1. Regular expression basics
# 2. Repetition, alternation, concat
# 3. Special operators ^, $, \b
# 4. Char classes
# 5. Capture groups
# 6. REs in split

def reportResults(re, strings)
   printf "Analysis for %s:\nMatches:", re.inspect
   for pattern in strings
      if re =~ pattern
         printf " %s", pattern
      end
   end
   printf "\nMismatches:"
   for pattern in strings
      if !(re =~ pattern)
         printf " %s", pattern
      end
   end
   printf "\n\n"
end

patterns = [
"abc",    "aaab",  "bcccc",  "abababc", " abab ",
"ababac", "de",    "abcde",  "acabbd",  "abbcd",
"d",      "dacda", "aa b",   "a\tbb",   "12.3",
"abcde",  "abcd",  ".33",    "12",      "abcabcbabcabc",
"b",      "axdy",  "aabbaa", "aabaa",   "aabbaaa"]

res = [
   /abc/,   
   /^abc$/,    
   /^a*bc+$/, 
   /^(ab)+c$/,
   /^abc|de$/,
   /^abb?c|de?$/,
   /^((a}bb)c)*d$/,
   /^((a}bb)c)*d$/,
   /^a.*c$/,
   /^a+\sb+$/,
   /^\s\w+\s$/,
   /^\d+\.?\d*$/,
   /^\D+$/,
   /^[ab]+$/,
   /^([ac-f][^ac-f])+$/,
   /^([abc]+)b\1$/,
   /^(a*)(b*)\2\1$/
]

for re in res
   reportResults(re, patterns)
end

# Simplify these:  /a**/ /a+*/ /a.*/ /(ab)?(ab)*/  /(a*|b*)+/  /ab?|ab/

# Note the capture in the re delimiter
"This,,line!@#has   odd...separators".split(/(\W+)/).each {|elem|
   printf "|%s", elem
}
printf "|\n"

