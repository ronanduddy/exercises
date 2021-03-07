# See: https://dev.to/baweaver/understanding-ruby-blocks-procs-and-lambdas-24o0
# All valid method arguments are also valid function arguments:
def all_types_of_args(a, b = 1, *cs, d:, e: 2, **fs, &fn)
end

mapper = -> (list, &block) {
  new_list = []
  list.each { |item| new_list << block.call(item) }

  new_list
}

list = mapper.call([1, 2, 3]) { |number| "a number #{number}" }
puts list

# this also works; pass lambda (as a proc? or block?) to a method
def map(list, &lambda)
  return list unless block_given?

  new_list = []
  list.each { |item| new_list << lambda.call(item) }

  new_list
end

add_one = -> a { a + 1 }
puts map([1, 2, 3])
puts map([1, 2, 3], &add_one)
