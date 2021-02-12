class Grid
  def initialize(extent)
    @extent = extent
    Array.new(@extent.max.x) { Array.new(@extent.max.y) }
  end

  def to_s
    require 'debug'
    "hello"
  end
end
