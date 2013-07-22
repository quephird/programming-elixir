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
        generator List.concat(clients, [pid])
    after
      @interval ->
        IO.puts "<tick from=\"#{inspect self}\" />"
        if Enum.count(clients) > 0 do
          [ first_client| rest_of_clients] = clients
          first_client <- { :tick}
          generator List.concat(rest_of_clients, [first_client])
        else
          generator clients
        end
    end
  end
end

