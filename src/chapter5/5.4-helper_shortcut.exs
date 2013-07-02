add_one = &1+1
IO.puts add_one.(44)

square = &1*&1
IO.puts square.(8)

times = &1*&2
IO.puts times.(3, 4)

IO.puts "Adding one to each element..."
Enum.each (Enum.map [1,2,3,4], &1+1), fn elem -> IO.puts elem end

IO.puts "Squaring each element..."
Enum.each (Enum.map [1,2,3,4], &1*&1), fn elem -> IO.puts elem end

IO.puts "Comparing each element to 3..."
Enum.each (Enum.map [1,2,3,4], &1<3), fn elem -> IO.puts elem end

