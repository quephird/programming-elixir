sum = fn (a, b) -> a + b end
IO.puts sum.(1,2)

greet = fn -> IO.puts "Hello" end
greet.()

f1 = fn a,b -> a * b end
IO.puts f1.(5,6)

f2 = fn -> 42 end
IO.puts f2.()

swap = fn {a, b} -> {b,a} end
IO.puts swap.({6, 8})

