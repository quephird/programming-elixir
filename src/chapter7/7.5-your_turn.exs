defmodule MyList do
  def mapsum(list, _func), do: _mapsum(list, _func, 0)

  def _mapsum([], _func, acc), do: acc
  def _mapsum([head|tail], func, acc), do: _mapsum(tail, func, acc+func.(head))
  
  def max(list), do: _max(list, nil)
  
  def _max([], acc), do: acc
  def _max([head|tail], nil), do: _max(tail, head) 
  def _max([head|tail], acc) when head>acc, do: _max(tail, head) 
  def _max([head|tail], acc), do: _max(tail, acc)

  def caesar(quoted_string, n), do: _caesar(quoted_string, n, "")
  
  def _caesar([], n, acc), do: acc
  def _caesar([head|tail], n, acc), do: _caesar(tail, n, acc <> <<97+(rem head-97+n,26)>>) 
end

IO.puts MyList.mapsum([], &1*&1)
IO.puts MyList.mapsum([1,2,3], &1*&1)

IO.puts MyList.max([])
IO.puts MyList.max([1])
IO.puts MyList.max([1,2,3,4])
IO.puts MyList.max([4,3,2,1])
IO.puts MyList.max([3,1,4,2])

IO.puts MyList.caesar('', 13)
IO.puts MyList.caesar('ryvkve', 13)

