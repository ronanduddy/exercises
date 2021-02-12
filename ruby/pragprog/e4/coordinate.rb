class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def self.origin
    self.new(0, 0)
  end

  def self.convert(token)
    x, y = 0, 0

    case token.name
    when :N
      y = token.value
    when :S
      y = -token.value
    when :E
      x = token.value
    when :W
      x = -token.value
    else
      # nothing...
    end

    self.new(x, y)
  end

  def +(other)
    x = @x + other.x
    y = @y + other.y

    self.class.new(x, y)
  end

  def offset(to)
    x, y = @x, @y

    x = -x if to.x.negative?
    y = -y if to.y.negative?

    self.class.new(x, y)
  end
end
