defmodule Tick do
  @interval 5000   # 5 seconds

  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name @name, pid
  end

  def register(client_pid) do
    :global.whereis_name(@name) <- { :register, client_pid}
  end
  
  def generator(clients) do
    receive do
      { :register, pid} ->
        IO.puts "<register from=\"#{inspect pid}\" />"
        generator [ pid| clients]
    after
      @interval ->
        IO.puts "<tick from=\"#{inspect self}\" />"
        Enum.each clients, (fn client -> client <- { :tick} end)
        generator clients
    end
  end
end
