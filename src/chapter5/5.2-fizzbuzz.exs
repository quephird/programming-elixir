fizz_buzz = fn
  0, 0, _        -> "FizzBuzz"
  0, _, _        -> "Fizz"
  _, 0, _        -> "Buzz"
  _, _, whatever -> whatever
end

IO.puts fizz_buzz.(0, 0, :foo)
IO.puts fizz_buzz.(0, :foo, :bar)
IO.puts fizz_buzz.(:foo, 0, :bar)
IO.puts fizz_buzz.(:foo, :bar, :baz)

fizz_buzz_driver = fn 
  n -> fizz_buzz.(rem(n,3), rem(n,5), n)
end

Enum.map(10..16, fn n -> IO.puts fizz_buzz_driver.(n) end)

