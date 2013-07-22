import :timer, only: [sleep: 1]

defmodule Monitor do
  def sad_method do
    sleep 500
    exit(99)
  end
  
  def run do
    ref = Process.spawn_monitor(Monitor, :sad_method, [])
    IO.puts inspect ref
    
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

