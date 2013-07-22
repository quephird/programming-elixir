defmodule Spawn do
  def greet do
    IO.puts "Hello"
  end
end

defmodule SpawnClient do
  def meet do
    spawn(Spawn, :greet, [])
  end
end

SpawnClient.meet

