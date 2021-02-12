require_relative 'extent'

class CoordinateSystem
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def offset
    coordinates = @coordinates.map { |coordinate| coordinate.offset(extent.min) }

    self.class.new(coordinates)
  end

  def extent
    @extent = Extent.new(@coordinates)
  end
end
