to_calculate = Enum.to_list 10..37

Enum.each 1..20, fn n -> 
  {time, result} = :timer.tc(FibScheduler, :run, [n, FibSolver, :fib, to_calculate])
  if n == 1 do
    IO.puts inspect result
    IO.puts "\n #    time(s)"
  end
  :io.format "~2B       ~.2f~n", [n, time/1000000.0]
end

#c("12.5-fib_scheduler.exs")
#FibScheduler.run 10, FibSolver, :fib, [5,3,7,2,9,4]
