def recursive_fib(num)
   num < 2 ? num : recursive_fib(num-1) + recursive_fib(num-2)
end

def iterative_fib(num)

  a = 0
  b = 1

  num.times do
    temp = a
    a = b
    b = temp + b
  end

  return a

end

require 'benchmark'
num = 35
puts recursive_fib(num)
puts iterative_fib(num)

Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end

