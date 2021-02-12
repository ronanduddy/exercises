require_relative 'lexer'
require_relative 'parser'
require_relative 'canvas'

commands = [
  'P 2', 'D', 'W 2', 'N 1', 'E 2', 'S 1', 'U'
]

lexer = Lexer.new(commands)
parser = Parser.new(lexer)
parser.parse

canvas = Canvas.new(parser.coordinates)
canvas.draw(parser.pen)
