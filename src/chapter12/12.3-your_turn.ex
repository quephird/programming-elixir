import :timer, only: [sleep: 1]

defmodule Spawn do
  def exiting_method(parent_pid) do
    parent_pid <- "Hey there!"
    exit(99)
  end
  
  def raising_method(parent_pid) do
    parent_pid <- "Hey there!"
    raise "99"
  end
  
  def run(process_method_name, child_method_name) do
    IO.puts "Spawning processes using #{process_method_name}..."
    IO.puts "Calling #{child_method_name}..."
    apply(Process, process_method_name, [Spawn, child_method_name, [self]])
    IO.puts "Sleeping..."
    sleep(5000)
    
    IO.puts "Waiting..."
    receive do
      msg ->
        IO.puts "Message received: #{inspect msg}"
      after 10000 ->
        IO.puts "Nothing happended AFAIAC. :("
    end
    
    # Ugh... another stupid puts statement to prevent swallowing of output above.
    IO.puts ""
  end
end

# elixir -r 12.3-your_turn.ex -e "Spawn.run :spawn_link, :exiting_method"
# elixir -r 12.3-your_turn.ex -e "Spawn.run :spawn_link, :raising_method"

# elixir -r 12.3-your_turn.ex -e "Spawn.run :spawn_monitor, :exiting_method"
# elixir -r 12.3-your_turn.ex -e "Spawn.run :spawn_monitor, :raising_method"

