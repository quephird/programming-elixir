defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(double(n))
end

IO.puts Times.double(21)
IO.puts Times.triple(21)
IO.puts Times.quadruple(21)

