defmodule Swapper do
  def swap([]), do: []
  def swap([a , b | tail]), do: [b, a | swap(tail)]
  def swap(_), do: raise "ERROR: swap only works on lists with even number of elements."
end

Swapper.swap([])
Swapper.swap([1,2,3,4,5,6])
Swapper.swap([1,2,3,4,5,6,7])


