class MyArray
  def initialize(*args)
    @list = args
  end

  def each
    index = 0
    while index < @list.length do
      yield @list[index], index
      index += 1
    end
  end

  # could DRY out `each` as so
  # def each(&fn)
  #   iterate(0, &fn)
  # end

  def each_start_from(start, &block)
    puts "in each start from"
    # pass the 'block function as an object' as an argument
    iterate(start, &block)
  end

  def length
    @list.length
  end

  def print
    puts "#{@list}"
  end

  private

  # methods can take regular params as well as block functions
  def iterate(position)
    index = position
    while index < @list.length do
      yield @list[index], index
      index += 1
    end
  end
end

array = MyArray.new(1,2,3,4,5)
array.print
puts "Length: #{array.length}"

array.each { |item| puts "Element: #{item}" }
array.each { |item, index| puts "Element at #{index}: #{item}" }

# print if item even
array.each do |item|
  puts item if item %2 == 0
end

# When inside block function, we still have access variables defined outside the
# block function, i.e. if variable is defined before the block body.
total = 0
array.each_start_from(3) do |item|
  puts "Element: #{item}"
  total += item
end
puts "Total (4+5): #{total}"
