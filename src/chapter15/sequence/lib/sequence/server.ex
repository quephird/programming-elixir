defmodule Sequence.Server do
  use GenServer.Behaviour
  
  # Public API
  
  def start_link(current_number) do
    :gen_server.start_link({ :local, :sequence}, __MODULE__, current_number, [])
  end
  
  def next_number do
    :gen_server.call :sequence, :next_number
  end
  
  def set_number(new_number) do
    :gen_server.call :sequence, {:set_number, new_number}
  end
  
  def increment_number(delta) do
    :gen_server.cast :sequence, {:increment_number, delta}
  end
  
  # GenServer callbacks
  
  def init(current_number)
  when is_number(current_number) do
    { :ok, current_number}
  end
  
  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number+1}
  end
  
  def handle_call({:set_number, new_number}, _, _) do
    { :reply, new_number, new_number}
  end
  
  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, current_number+delta}
  end
end
