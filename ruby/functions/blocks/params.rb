# Note if one would like to define a block and use it with many methods
# then use a proc. Block functions are tied more to a method call.
# Also note that a method can only really take one block function at a time.

# When a block is passed like this and stored in a variable,
# it is automatically converted to a proc.
def print_my_name(&blk)
  # It's possible to pass args to a block! The args can then be used when
  # invoking the method
  blk.call('ronan', 'duddy')
end

# The arguments to `call` are passed into the block function here as parameters.
print_my_name do |first, last|
  # We are able to access the block params in the block function's body - magic.
  puts "Hi there #{first} #{last}"
end

# this 'numbered param' syntax can also be used
print_my_name { puts _1.upcase , _2.upcase }
