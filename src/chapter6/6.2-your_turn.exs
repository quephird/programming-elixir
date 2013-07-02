defmodule SumOf1 do
  def to(1), do: 1
  def to(n), do: n + to(n-1)
end

IO.puts SumOf1.to(1)
IO.puts SumOf1.to(2)
IO.puts SumOf1.to(10)

defmodule GCD do
  def of(x,0), do: x
  def of(x,y), do: of(y, rem(x,y))
end

IO.puts GCD.of(1,0)
IO.puts GCD.of(0,1)
IO.puts GCD.of(3,7)
IO.puts GCD.of(7,3)
IO.puts GCD.of(4,2)
IO.puts GCD.of(54,24)

