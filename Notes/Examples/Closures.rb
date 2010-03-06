class Sample
   @@cVar = 0
 
   def initialize(name)
      @name = name
      @counter = 0
   end

   attr_accessor :counter, :name

   def getClosure
      localVar = 0

      return lambda {  # or return proc { ... 
         @@cVar += 1
         @counter += 1
         localVar += 1

         puts "#{@name} #{@@cVar} #{@counter} #{localVar}"
      }
   end
end

s1 = Sample.new("Sample1")
s2 = Sample.new("Sample2")

c1 = s1.getClosure
c1.call                   #                         
c1.call                   # 

c1a = s1.getClosure
c1a.call                  #
c1.call                   #

c2 = s2.getClosure
c2.call                   #
c1a.call                  #

s1 = Sample.new("Sample3") 
c3 = s1.getClosure
c3.call                   # 
c2.call                   # 
c1.call                   # 

Sample.new("Sample1").getClosure.call  # 
