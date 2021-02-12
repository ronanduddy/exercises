class Token
  attr_reader :name, :value

  def initialize(name, value = nil)
    @name = name
    @value = value
  end

  def to_s
    "{#{@name}: #{@value}}"
  end
end
