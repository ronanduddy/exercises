# ampersand (&) is used to convert something to a proc by calling `to_proc` on it
[1,2,3].map(&:to_s)
[1,2,3].map {|i| i.to_s }
[1,2,3].map {|i| i.send(:to_s) }

# `to_proc` looks like
class Symbol
  def to_proc
    Proc.new { |i| i.send(self) }
  end
end
