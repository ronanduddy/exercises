# Proc functions and lambda functions have an attribute where it will capture
# the current execution scope within it - a closure. This includes references
#  to local vars, methods etc.
def exec_proc(fn)
  num = 1
  fn.call # 2 prints
end

num = 2
# the 'closure' effect occurs here; use the value from the place where the proc
# is defined.
my_proc = Proc.new { puts num }
puts exec_proc(my_proc) # nothing prints
