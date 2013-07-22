defmodule TickClient do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Tick.register pid
  end

  def receiver do
    receive do
      { :tick} ->
        IO.puts "<tock from=\"#{inspect self}\" />"
        receiver
    end
  end
end

