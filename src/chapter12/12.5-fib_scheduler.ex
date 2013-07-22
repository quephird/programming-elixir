defmodule FibScheduler do
  def run(num_processes, module, func, to_calculate) do
    processes = Enum.map(1..num_processes, fn (_n) -> spawn(module, func, [self]) end)
    schedule_processes(to_calculate, [], processes)
  end
  
  defp schedule_processes(queue, results, processes) do
    receive do
      {:ready, pid} when length(queue)> 0 ->
        [ next| tail] = queue
        pid <- {:fib, next, self}
        schedule_processes(tail, results, processes)

      {:ready, pid} ->
        pid <- {:shutdown}
        if length(processes)> 1 do
          schedule_processes(queue, results, List.delete(processes, pid))
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 < n2 end)
        end

      {:answer, number, fibonacci, _pid} ->
        schedule_processes(queue, [ {number, fibonacci}| results], processes)
    end
  end
end

