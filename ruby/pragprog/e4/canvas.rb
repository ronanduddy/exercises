require_relative 'coordinate_system'
require_relative 'grid'

class Canvas
  def initialize(coordinates)
    @coordinate_system = CoordinateSystem.new(coordinates).offset
  end

  def draw(pen)
    result = []

    # result << '_' * @coordinate_system.extent.max.x * 2 + "\n"
    # result << "|\n" * @coordinate_system.extent.max.y * 2
    # result << '_' * @coordinate_system.extent.max.x * 2
    # result << "|\n" * @coordinate_system.extent.max.y * 2
    # x_range.each do |x|
    # # y_range.each do |y|
    #     # require 'debug'
    #     result << ('_' * x) + "\n"
    #     # result << ('|' * y)
    #   # end
    # end
    # pp @coordinate_system.coordinates
    # pp '+'
    # @coordinate_system.coordinates[1..-2].each  do |coordinate|
    #   pp '-' * coordinate.x if coordinate.x.positive?
    #   pp '|' * coordinate.y if coordinate.y.positive?
    # end

    point = '+'
    x_mark = '--'
    y_mark = '|'
    space = '  '
    newline = "\n"

    "#{point}#{x_mark}#{x_mark}#{point}#{newline}"
    "#{y_mark}#{space}#{space}#{y_mark}#{newline}"
    "#{point}#{x_mark}#{x_mark}#{point}#{newline}"

    "+----+\n"
    "|    |\n"
    "+----+\n"

    grid = Grid.new(@coordinate_system.extent)

    puts grid
  end

  private

  def x_range
    @coordinate_system.extent.min.x..@coordinate_system.extent.max.x
  end

  def y_range
    @coordinate_system.extent.min.y..@coordinate_system.extent.max.y
  end
end
