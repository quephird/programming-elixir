IO.puts "Original list..."
Enum.each [1,2,3,4], IO.puts &1

IO.puts "New list with one added to each..."
Enum.each (Enum.map [1,2,3,4], &1+2), IO.puts &1


