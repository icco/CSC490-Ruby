# Concepts
# 1. Operator overloading
# 2. Left/right operands
# 3. Coerce
# 4. == vs equal?  Object versions thereof
# 5. include Comparable and <=>
# 6. Numeric base class
# 7. simplify method and assignments
# 8. eql? and hash
# 9. to_s
#10. attr_reader

class MyRational < Numeric
   attr_reader :num, :den
   include Comparable

   def initialize(num = 0, den = 1)
      @num = num
      @den = den
      simplify
   end

   def +(rhs)
      MyRational.new(@num*rhs.den + rhs.num*@den, @den*rhs.den).simplify
   end

   def -(rhs)
      MyRational.new(@num*rhs.den - rhs.num*@den, @den*rhs.den).simplify
   end

   def *(rhs)
      MyRational.new(@num*rhs.num, @den*rhs.den).simplify
   end

   def /(rhs)
      MyRational.new(@num*rhs.den, @den*rhs.num).simplify
   end

   def eql?(rhs)
      return self == rhs
   end

   def hash
      return @num.hash * @den.hash
   end

   def <=>(rhs)
      return @num*rhs.den <=> @den*rhs.num
   end

   def to_s
      return @num.to_s + "/" + @den.to_s
   end

   def coerce(other)
      [other, @num / @den]
   end

   protected  # Why not private?
 
   def simplify
     raise Exception "0 denominator!" if @den == 0
     if @den > @num
         large, small = @den, @num
      else
         large, small = @num, @den
      end

      large, small = small, (large % small) until small == 0
      @den, @num = @den/large, @num/large
      self
   end
end

val1 = MyRational.new 2, 3
val2 = MyRational.new 8, 10

puts("Values: #{val1} #{val2}")
val3 = val1 + val2
val3 += val1

puts("Twice val1 plus val2: #{val3}")
puts("Val1 / val2: #{val1 / val2}")

puts("2+val3: #{2 + val3}")

val4 = MyRational.new(2,3)
puts("val1 == val4: #{val1 == val4}  val1.equal?(val4): #{val1.equal?(val4)}")