defmodule MyList do
  def sum(list), do: _sum(list, 0)

  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head+total)
end

IO.puts MyList.sum([1,2,3,4,5])
IO.puts MyList.sum([11,12,13,14,15])


