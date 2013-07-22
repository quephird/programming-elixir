defmodule Search do
  def fib(scheduler) do
    scheduler <- {:ready, self}
    receive do
      {:fib, file_name, client} ->
        client <- {:answer, file_name, occurences_of_cat_in_file(file_name), self}
        fib(scheduler)
      {:shutdown} ->
        exit(0)
    end
  end

  def occurences_of_cat_in_file(file_name) do
    Enum.count Regex.scan(%r/cat/, File.read file_name)
  end
end

 files_to_search = File.ls! 
# files_to_search = File.ls! "e:\\temp"
# files_to_search = File.ls "c:\\windows\\inf" 

# Lots of challenges here due mainly to Windows (I think)
#
# * File.ls! on a "remote" directory yields a list of files but operating on that list does not work.
# * Attempting to read a directory instead of a file with File.read! is an error (by design),
#   but attempting to filter the file list using File.dir? doesn't work if not in that directory.

Enum.each 1..1, fn n -> 
  {time, result} = :timer.tc(FibScheduler, :run, [n, Search, :fib, files_to_search])
  if n == 1 do
    IO.puts inspect result
    IO.puts "\n #    time(s)"
  end
  :io.format "~2B       ~.2f~n", [n, time/1000000.0]
end

