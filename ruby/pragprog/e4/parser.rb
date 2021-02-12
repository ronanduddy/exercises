require_relative 'pen'
require_relative 'coordinate'

class Parser
  ParseError = Class.new(StandardError)

  attr_reader :pen, :coordinates

  def initialize(lexer)
    @lexer = lexer
    @current_token = nil
    @drawing = false
    @pen = nil
    @coordinates = [Coordinate.origin]
  end

  def parse
    tokenise
    select_pen
    pen_down
    direction while @drawing
    pen_up
  end

  private

  def tokenise
    @last_token = @current_token
    @current_token = @lexer.tokenise
  end

  def select_pen
    if @current_token.name == :P && !@current_token.value.nil?
      @pen = Pen.new(@current_token.value)
      tokenise

      return
    end

    parse_error
  end

  def pen_down
    if @current_token.name == :D && @current_token.value.nil?
      tokenise
      @drawing = true

      return
    end

    parse_error
  end

  def pen_up
    if @current_token.name == :U && @current_token.value.nil?
      tokenise

      return
    end

    parse_error
  end

  def direction
    if [:N, :S, :E, :W].include?(@current_token.name) && @current_token.value.positive?
      @coordinates << coordinate
      tokenise
      check_ahead

      return
    end

    parse_error
  end

  def coordinate
    @coordinates.last + Coordinate.convert(@current_token)
  end

  def check_ahead
    @drawing = false if @current_token.name == :U
  end

  def parse_error
    raise ParseError, "Error: invalid token #{@current_token}"
  end
end
