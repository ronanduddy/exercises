# Blocks are little anonymous functions that can be passed into methods.

# Treating the block function as an argument to a method; this parameter takes
# a block as an object defined/declared by the ampersand. This is an explicit block
# as in it has been given a name in the methods parameter list.
def my_method(&my_block)
  puts 'at start of my_method'
  # blocks have a `call` method used to invoke them (later), the blocks code
  my_block.call
  puts 'at end of my_method'
end

# pass a block function (a chunck of code) to my_method
my_method { puts 'in the block' }

# pass a different block to my_method
my_method { puts 1+1 }

# invoke/call block twice
def twice(&block)
  puts 'at start of twice'
  block.call
  puts 'at middle of twice'
  block.call
  puts 'at end of twice'
end

twice { puts 'in the block' }

# if you want to store a block function, use a proc/lambda
