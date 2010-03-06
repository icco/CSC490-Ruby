# Copyright 2010 Software Inventions, Inc
# 1. Basic file I/O
# 2. Exception handling -- raise, rescue, ensure
# 3. Exception hierarchy
# 4. ARGV
# 5. Float and related conversion methods

# One row of a grade sheet, including the student name and an arbitrary list
# of numerical grades,  Another row may be merged with this one, via "merge"

class GradeRow
   def initialize(name, grades)
      @name = name
      @grades = grades
   end

   attr_accessor :grades, :name

   def merge(other)
#     puts "Merging #{self} with #{other}"

      for ndx in (0...other.grades.length)
         if other.grades[ndx] != nil 
            if grades[ndx] != nil
               raise Exception.new("Conflicting grades for " + @name)
            elsif other.grades[ndx] < 0 || other.grades[ndx] > 100
               raise RangeError.new("Grade value #{other.grades[ndx]} out of range.")
            else
               grades[ndx] = other.grades[ndx]
            end
         end
      end
   end

   def to_s
      rtn = "#{@name}: "
      for i in @grades
         rtn << (i == nil ? " --" : " #{i}")
      end
      rtn
   end
end

# Process any "input" entity (I/O stream or otherwise) whose iterator produces
# a series of lines of the format <name> : grade1 grade2 ... gradeN   where grades
# are either numbers or "n/a".  Merge the GradeRow represented by each line into 
# a name-indexed hash of GradeRows in "grades".

def processStream(input, grades)
   for line in input 
      begin
         name, vals = line.split(":")
         vals = vals.split.map {|grade| grade == "n/a" ? nil : Float(grade)}
         if grades.has_key?(name)
            grades[name].merge(GradeRow.new(name, vals))
         else
            grades[name] = GradeRow.new(name, vals)
         end
   
      rescue ArgumentError
         puts "Dropping bad line due to malformed grade: #{line}"
      rescue RangeError => err
         puts "Dropping bad line due to out of range grade: #{err.message}"   
      rescue Exception => err
         puts "Fatal error in #{line}"
         raise err         
      end
   end      
end

grades = Hash.new()

# Test block   
#begin 
#   processStream([
#      "Staley: 12 14.5 what?",
#      "Jones: n/a n/a 9"
#   ], grades)

#   processStream([
#      "Staley: n/a n/a 12.0",
#      "Jones: 8 n/a n/a"
#   ], grades)

#rescue Exception => err
#   puts err.class
#   puts "Stream processing failed: " + err.message
#end

# Assume first commandline argument is a desired output file, and the 
# rest are input files holding lines of the format required by 
# processStream.  Process all input files, creating a single hash,
# which hash you then output to the output file.

outName = ARGV.shift

ARGV.each { |file|
   begin
      inFile = File.open(file, "r")
      processStream(inFile, grades)
   rescue Exception => err
      puts "Stream processing failed: " + err.message
   ensure
      inFile.close
   end
}

begin
   outFile = File.open(outName, "w")

   for pair in grades
      outFile.puts pair[1]
   end
rescue Exception => err
   puts "Output failed: " + err.message
ensure
   outFile.close
end