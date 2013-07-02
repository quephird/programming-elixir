defmodule MyList do
  def square([]), do: []
  def square([head|tail]), do: [head*head | square(tail)]
  
  def add_1([]), do: []
  def add_1([head|tail]), do: [head+1 | add_1(tail)]
end

Enum.each MyList.square([]), fn e -> IO.puts e end
Enum.each MyList.square([4,5,6]), fn e -> IO.puts e end

Enum.each MyList.add_1([]), fn e -> IO.puts e end
Enum.each MyList.add_1([4,5,6]), fn e -> IO.puts e end

