defmodule UsingDo do
  def double(n), do: n*2

  def greet(greeting, name), do: (
    IO.puts greeting
    IO.puts "How're you doing, #{name}"
  )
end

IO.puts UsingDo.double(6)
IO.puts UsingDo.greet("Hey", "Danielle")

