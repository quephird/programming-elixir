import :timer, only: [sleep: 1]

defmodule Parallel do
  def pmap(collection, func) do
    me = self
    
    collection
      |> (Enum.map fn (elem) -> spawn_link fn -> (me <- {self, func.(elem)}) end end)
      |> (Enum.map fn (pid) -> receive do {^pid, result} -> result end end)
  end
 
  def pmap_bad(collection, func) do
    collection
      |> (Enum.map fn (elem) -> spawn_link fn -> (self <- {self, func.(elem)}) end end)
      |> (Enum.map fn (pid) -> receive do {^pid, result} -> result end end)
  end
  
  def pmap_process_ordering(collection, func) do
    me = self
    
    collection
      |> (Enum.map fn (elem) -> spawn_link fn -> (me <- {self, func.(elem)}) end end)
      |> (Enum.map fn (pid) -> receive do {_pid, result} -> result end end)
  end

  def delayed_square(n) do
    sleep (10-n)*100
    n*n
  end
end

Parallel.pmap 1..10, &1*&1

# "me" is used instead of "self" in order to capture the PID of the parent process.
# Below hangs because (I think) self is evaluated within the context of the _child_ process
# and so each process simply sends a message to itself while the parent waits indefinitely.
#
# Parallel.pmap_bad 1..10, &1*&1

# Using ^pid produces a list of results in the order in which each child process was invoked;
# using _pid produces a list in the order in which processes return their results.
# delayed_square takes longer for smaller numbers, and so delayed_square(1) will return after delayed_square(2), etc.
#
Parallel.pmap 1..10, Parallel.delayed_square &1
Parallel.pmap_process_ordering 1..10, Parallel.delayed_square &1

