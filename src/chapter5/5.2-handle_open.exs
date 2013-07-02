handle_open = fn
  {:ok, file} -> "Read data: #{IO.readline(file)}"
  {_, error}  -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("handle_open.ex"))
IO.puts handle_open.(File.open("handle_open.exs"))

