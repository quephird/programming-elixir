defmodule MyList do
  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]
end

Enum.each MyList.map([1,2,3,4], fn(n) -> n+1 end), fn e -> IO.puts e end
Enum.each MyList.map([1,2,3,4], fn(n) -> n>2 end), fn e -> IO.puts e end

Enum.each MyList.map([1,2,3,4], &1+1), fn e -> IO.puts e end
Enum.each MyList.map([1,2,3,4], &1>2), fn e -> IO.puts e end

