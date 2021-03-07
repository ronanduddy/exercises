# procs don't care about arguments (sort of similar to block functions in this
# regard and also syntax), however lambdas do
another_proc = Proc.new { |x, y| puts "x: #{x}, y: #{y}" }
another_proc.call
another_proc.call(1)
another_proc.call(1, 2)

# passing a proc explicitly
def pass_proc_to_method(proc)
  proc.call('duddy')
end

proc = Proc.new { |last| puts "hello ronan #{last}" }
pass_proc_to_method(proc)

# if inside method then this would return from that method
def return_from_proc
  Proc.new { return 2 }.call
  puts 'after proc - never called'
end

puts return_from_proc

# however Should raise exception, can't return from top-level context;
my_proc = Proc.new { return 1 }
puts "Proc result: #{my_proc.call}"
