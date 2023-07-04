class Triangle
  # write code here
  class TriangleError < StandardError; end
  def initialize(length1,length2,length3)
    @length1=length1
    @length2=length2
    @length3=length3
    validate_triangle
  end
  def kind
    if @length1==@length2 && @length2==@length3
      :equilateral
    elsif @length1==@length2 || @length2==@length3 || @length1==@length3
      :isosceles
    elsif @length1!=@length2 && @length2!=@length3 && @length1!=@length3
      :scalene
    end
  end
  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    if @length1 <= 0 || @length2 <= 0 || @length3 <= 0
      raise TriangleError, 'Triangle sides must have positive lengths'
    end
  end

  def validate_triangle_inequality
    if (@length1 + @length2 <= @length3) || (@length1 + @length3 <= @length2) || (@length2 + @length3 <= @length1)
      raise TriangleError, 'Triangle violates the triangle inequality'
    end
  end
 
end
