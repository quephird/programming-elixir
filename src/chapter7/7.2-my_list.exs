defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)
end

IO.puts MyList.len([])
IO.puts MyList.len([1])
IO.puts MyList.len([1,2,3,4,5])

