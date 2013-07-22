defmodule Chain do
  def counter(next_pid) do
    receive do
      n -> 
        next_pid <- n+1
    end
  end
  
  def create_processes(n) do
    last = Enum.reduce 1..n, self, fn(_, next_pid) -> spawn(Chain, :counter, [next_pid]) end
    last <- 0
    receive do
      final_answer -> 
        "Final answer is #{final_answer}."
    end
  end
  
  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
    # Superfluous statement to prevent output above from being swallowed on Windows
    IO.puts ""
  end
end

