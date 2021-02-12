require_relative 'coordinate'

class Extent
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def max
    @max ||= Coordinate.new(@coordinates.map(&:x).max, @coordinates.map(&:y).max)
  end

  def min
    @min ||= Coordinate.new(@coordinates.map(&:x).min, @coordinates.map(&:y).min)
  end
end
