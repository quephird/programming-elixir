defmodule FredAndBetty do
  def send_token_back(pid) do
    receive do
      token -> 
        pid <- token
    end
  end

  def create_processes do
    tokens = [:fred, :wilma, :betty, :barney]
    processes = Enum.map tokens, fn token -> {spawn(FredAndBetty, :send_token_back, [self]), token} end
    Enum.each processes, fn {pid, token} -> (pid <- token) end
    listen
  end
  
  def listen do
    receive do
      token -> IO.puts "#{token} received!"
    end
    listen
  end
end

FredAndBetty.create_processes
    
