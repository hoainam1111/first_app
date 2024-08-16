# recursion
def recursion(n)
    return n if n <= 1
    recursion(n - 1) + recursion(n-2)
end
def print_recursion(length)
    (0...length).each do |i|
        print recursion(i)
        print ", " unless i == length - 1
    end
    puts
end

print_recursion(10)
# iterative
def fibonacci_iterative(n)
    fib_sequence = []
    (0...n).each do |i|
      if i == 0 || i == 1
        fib_sequence << i
      else
        fib_sequence << fib_sequence[-1] + fib_sequence[-2]
      end
    end
    fib_sequence
  end
  
  def print_fibonacci_iterative(length)
    sequence = fibonacci_iterative(length)
    puts sequence.join(", ")
  end
  
  print_fibonacci_iterative(10)
