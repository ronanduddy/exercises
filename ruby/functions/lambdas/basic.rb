# A lambda function is like a block function but with a different syntax. It is
# still a way to define a block and its parameters, however it can be assigned
# for later use, unlike a plain old block function.

say_hello = -> { puts 'hello' }
say_hello.call

# there are other ways to create a lambda and call it:
another_hello = lambda { puts 'another_hello' }
another_hello.call
another_hello.()
another_hello[]
another_hello.===
