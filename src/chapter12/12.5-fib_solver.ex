defmodule FibSolver do
  def fib(scheduler) do
    scheduler <- {:ready, self}
    receive do
      {:fib, n, client} ->
        client <- {:answer, n, fib_calc(n), self}
        fib(scheduler)
      {:shutdown} ->
        exit(0)
    end
  end
  
  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
end

