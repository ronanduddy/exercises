require_relative 'coordinate_system'

class Canvas
  def initialize(coordinates)
    @coordinate_system = CoordinateSystem.new(coordinates).offset
  end

  def draw(pen)
    pp  @coordinate_system.coordinates
  end
end
