list = [1,3,5,7,9]

IO.puts "Doubling each element..."
Enum.each (Enum.map list, fn elem -> elem*2 end), fn elem -> IO.puts elem end

IO.puts "Squaring each element..."
Enum.each (Enum.map list, fn elem -> elem*elem end), fn elem -> IO.puts elem end

IO.puts "Comparing each element to 6..."
Enum.each (Enum.map list, fn elem -> elem>6 end), fn elem -> IO.puts elem end

