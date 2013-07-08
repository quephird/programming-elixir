defmodule PragProg do
  defrecord Order,
    id: nil, ship_to: nil, net_amount: nil, sales_tax: nil

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
    Order.new id: id, ship_to: binary_to_atom(ship_to), net_amount: net_amount
  )
  
  def process_orders(orders, tax_rates), do: (
    Enum.map orders, fn order -> order.sales_tax lookup_tax(tax_rates, order.ship_to) end
  )

  def lookup_tax(tax_rates, state), do: (
    {_, sales_tax} = List.keyfind(tax_rates, state, 0, {state, 0})
    sales_tax
  )
end

orders = PragProg.load_orders_from_file("orders.csv")
tax_rates = [ NC: 0.075, TX: 0.08 ]
processed_orders = PragProg.process_orders(orders, tax_rates)
