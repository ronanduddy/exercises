# lambdas, like block functions can take parameters, it is strict on parameters
print_name = ->(first, last) { puts "hello #{first} #{last}" }
print_name.call('ronan1', 'duddy1')
print_name.yield('ronan2', 'duddy2')

# similar to explicit blocks, lambda that is passed into method is converted to
# a proc using the `&` (ampersand) syntax
def printer(&fn)
  fn.call('fiona1', 'mclaughlin1')
  yield 'fiona2', 'mclaughlin2'
end

# lambdas, like blocks, can be passed and used in methods
printer(&print_name)

# printer { print_name }

# Equivalent to Proc.new, except the resulting Proc objects check the
# number of parameters passed when called.
procy_lambda = lambda { |first, last| puts "hello again #{first} #{last}" }
printer(&procy_lambda)

# A 'lambda', is a special Proc object, therefore there's no Lambda class, in
# contrast to how we have a Proc class

# Like a method, it's possible to return values and add conditionals
x = 2
my_lambda = -> { return 1 if x == 2 }
puts "Lambda result: #{my_lambda.call}"

# alternative approach below for above
my_other_lambda = -> num { return 1 if num == 2 }
puts "Other lambda result: #{my_other_lambda.call(1)}"
