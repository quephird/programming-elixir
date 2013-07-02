defmodule Chop do
  def guess(n, a..b), do: (
    guess_helper(n, div(a+b,2), a..b)
  )

  def guess_helper(n, g, a..b) when g>n, do: (
    IO.puts "Is it #{g}?"
    guess_helper(n, div(a+g,2), a..g-1)
  )

  def guess_helper(n, g, a..b) when g<n, do: (
    IO.puts "Is it #{g}?"
    guess_helper(n, div(g+b,2), g+1..b)
  )

  def guess_helper(_, g, _), do: (
    IO.puts g
  )
end

Chop.guess(500, 1..1000)
Chop.guess(273, 1..1000)
Chop.guess(122, 1..1000)
Chop.guess(999, 1..1000)

