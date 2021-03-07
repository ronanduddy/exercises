# procs are simlar to lambdas, main difference is in creation
my_proc = Proc.new { |name| puts "hi #{name}" }
my_proc.call('ronan')
my_proc.('ronan')
my_proc['ronan']
my_proc.==='ronan'

# Possible to check if a proc is a lambda as a lambda is just a special proc
# object:
lambda_checker = ->(obj) { puts "is proc a lambda? #{obj.lambda?}" }
lambda_checker.call(my_proc)

# pass self (a lambda) in
lambda_checker.call(lambda_checker)
