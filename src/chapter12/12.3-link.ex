import :timer, only: [sleep: 1]

defmodule Link do
  def sad_method do
    sleep 500
    exit(99)
  end
  
  def run do
    spawn_link(Link, :sad_method, [])
    
    receive do
      msg ->
        IO.puts "Message received: #{inspect msg}"
      after 1000 ->
        IO.puts "Nothing happended AFAIAC. :("
    end
    
    # Ugh... another stupid puts statement to prevent swallowing of ones above.
    IO.puts ""
  end
end

