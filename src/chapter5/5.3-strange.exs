strange = fn -> fn -> "Hello" end end

strange.()

IO.puts strange.().()

other = strange.()

IO.puts other.()

