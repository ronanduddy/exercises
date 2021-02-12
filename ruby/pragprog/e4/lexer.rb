require_relative 'token'

class Lexer
  TokeniseError = Class.new(StandardError)

  KEYWORDS = [ 'P', 'D', 'U', 'N', 'S', 'E', 'W' ]

  def initialize(commands)
    @commands = commands
    @current_command = nil
    @current_index = 0
  end

  def tokenise
    return false if eof?

    sanitise
    increment

    token
  end

  private

  def eof?
    @current_index == @commands.length
  end

  def sanitise
    array = @commands[@current_index].split

    if array.length == 2
      @current_command = array
    elsif array.length == 1
      @current_command = [array.first, nil]
    end
  end

  def increment
    @current_index += 1
  end

  def token
    return Token.new(sanitised_name, sanitised_value) if keyword?

    raise TokeniseError, "Error: unsupported keyword #{@current_command.first}"
  end

  def keyword?
    KEYWORDS.include? @current_command.first
  end

  def sanitised_name
    @current_command.first.intern
  end

  def sanitised_value
    Integer(@current_command.last)
  rescue NameError, TypeError => e
    nil
  end
end
