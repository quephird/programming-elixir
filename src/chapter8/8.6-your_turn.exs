defmodule MyString do
  def tidy_text(string), do: (
    sentences =
      Enum.map String.split(string, "."), _tidy_sentence &1 
    Enum.join sentences, ". "
  )
  
  defp _tidy_sentence(sentence), do:
    sentence |> String.lstrip |> String.capitalize
end

MyString.tidy_text("oh. a DOG. woof. ")

defmodule PragProg do
  def load_orders_from_file(filename), do: (
    {_status, file} = File.open(filename)
    orders = _load_orders_from_file(file, [])
    File.close(file)
    orders
  )
  
  def _load_orders_from_file(file, orders), do: (
    line = IO.readline(file)
    if line == :eof, do:
      orders,
    else: (
      _load_orders_from_file(file, [parse_line(line) | orders])
    )
  )
  
  defp parse_line(line), do: (
    [id, ship_to, net_amount] = String.split(line, ",")
    [id: id, ship_to: binary_to_atom(ship_to), net_amount: net_amount]
  )
end

PragProg.load_orders_from_file("orders.csv")

