defmodule Stack.Server do
  use GenServer.Behaviour
  
  @server_name :stack
  
  # Public API
  
  def start_link(initial_stack) do
    :gen_server.start_link {:local, @server_name}, __MODULE__, initial_stack, []
  end

  def pop do
    :gen_server.call @server_name, :pop
  end

  def push(new_element) do
    :gen_server.cast @server_name, { :push, new_element}
  end
  
  # GenServer callbacks

  def init(current_stack)
  when is_list(current_stack) do
    { :ok, current_stack}
  end
  
  def handle_call(:pop, _, current_stack = [head | tail])
  when length(current_stack) > 0 do
    { :reply, head, tail}
  end
  
  def handle_cast({:push, new_element}, current_stack) do
    { :noreply, [new_element | current_stack]}
  end
  
  def terminate(reason, current_state) do
    IO.puts """
      Server is terminating...
      
      Reason: #{inspect reason}
      Current state: #{inspect current_state}
    """
  end
end
