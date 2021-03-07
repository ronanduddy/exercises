# `yield` is functionally equivalent to fn.call. It will find and invoke
# the block function that a method has been called with. Or it will invoke
# the block that has been 'passed into' a method. There's no need for the
# `&block` parameter which can be used to accept the block.
def triple
  yield
  yield # implicit block passing does not use `&block`, there yield will infer
  yield
end

triple { puts 'hello world' }

def my_name
  # similar to `block.call(p1, p2)`, we can pass arguments to `yield`. This is
  # also functionally equivalent.
  yield 'ronan', 'duddy'
end

# block function parameters are optional:
my_name { puts 'hello' }
my_name { |first| puts "hello #{first}" }
my_name { |first, last| puts "hello #{first} #{last}" }
