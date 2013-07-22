defmodule Chain do
  def counter(next_pid) do
    receive do
      n -> (
        IO.puts "Process #{inspect next_pid} to be called." 
        next_pid <- n+1
      )
    end
  end
  
  def create_process(next_pid) do
    pid = spawn(Chain, :counter, [next_pid])
    IO.puts "Process #{inspect pid} created."
    pid
  end
  
  def create_processes(n) do
    IO.puts "Self is process #{inspect self}"
    last = Enum.reduce 1..n, self, fn(_, next_pid) -> create_process(next_pid) end
    IO.puts "Process #{inspect last} to kick computation off."
    last <- 0
    receive do
      final_answer -> (
        IO.puts "Self has been sent message."
        "Final answer is #{final_answer}."
      )
    end
  end
  
  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end

Chain.run 5

