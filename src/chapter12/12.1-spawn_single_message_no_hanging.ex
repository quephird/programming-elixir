defmodule Spawn do
  def greet do
    receive do
      {sender, message} ->
        sender <- {:ok, "Hello, #{message}!!!"}
    end
  end
end

defmodule SpawnClient do
  def meet do
    pid = spawn(Spawn, :greet, [])

    pid <- {self, "World"}
    receive do
      {:ok, message} ->
        IO.puts message
    end

    pid <- {self, "Kermit"}
    receive do
      {:ok, message} ->
        IO.puts message
      after 500 ->
        IO.puts "The greeter has hung up. :("
    end
  end
end

SpawnClient.meet

