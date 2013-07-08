defmodule MyEnum do
  def all?(l), do: all?(l, fn e -> e end)
  def all?([], _func), do: true
  def all?([h|t], func), do: (
    if func.(h), do:
      all?(t, func),
    else:
      false
  )

  def each([], _func), do: []
  def each([h|t], func), do: (
    func.(h)
    each(t, func)
  )
  
  def filter([], _pred), do: []
  def filter([h|t], pred), do: (
    if pred.(h), do:
      [h | filter(t, pred)],
    else:
      filter(t, pred)
  )

  # TODO: handle negative second argument
  def split(l, n), do: _split(l, n, [])

  defp _split([], _n, acc), do: {acc,[]}
  defp _split(l, 0, acc), do: {acc, l}
  defp _split([h|t], n, acc), do: _split(t, n-1, acc++[h])
  
  def take(l, n), do: _take(l, n, [])
  
  defp _take([], _n, acc), do: acc
  defp _take(_l, 0, acc), do: acc
  defp _take([h|t], n, acc), do: _take(t, n-1, acc ++ [h])
end

MyEnum.all? [1,2,3]
MyEnum.all? [1,nil,3]
MyEnum.all? [2,4,100], fn n -> rem(n,2) == 0 end

MyEnum.each [], IO.puts &1
MyEnum.each [9,8], IO.puts &1

MyEnum.filter [], fn n -> rem(n,2) == 0 end
MyEnum.filter [9,8,7,6,5], fn n -> rem(n,2) == 0 end

MyEnum.split [],4
MyEnum.split [1,2,3,4,5,6],4

MyEnum.take [],4
MyEnum.take [1,2,3,4,5,6],0
MyEnum.take [1,2,3,4,5,6],4

defmodule MyList do
  def span(from, to), do: (
    if (from == to), do:
      [from],
    else:
      [from | span(from+1, to)]
  )
end

MyList.span(2,2)
MyList.span(1,10)

defmodule Math do
  def primes_up_to(n), do: (
    lc p inlist MyList.span(2,n), prime?(p), do: p
  )
  
  defp prime?(n), do: (
    ds = lc d inlist MyList.span(1,n), d*d <= n, rem(n,d) == 0, do: d
    if Enum.count(ds) == 1, do:
      true,
    else:
      false
  )
end

Math.primes_up_to(10)
Math.primes_up_to(100)
Math.primes_up_to(1000)

defmodule PragProg do
  def orders_with_total_amount(orders, tax_rates), do: (
    lc order = [{_, id}, {_, order_state}, {_, net_amount}] inlist orders, do: (
      tax_rate = Keyword.get(tax_rates, order_state)
      if tax_rate != nil, do:
        [{:total_amount, net_amount*(1+tax_rate)} | order],
      else:
        [{:total_amount, net_amount} | order]
    )
  )
end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
[ id: 123, ship_to: :NC, net_amount: 100.00 ],
[ id: 124, ship_to: :OK, net_amount: 35.50 ],
[ id: 125, ship_to: :TX, net_amount: 24.00 ],
[ id: 126, ship_to: :TX, net_amount: 44.80 ],
[ id: 127, ship_to: :NC, net_amount: 25.00 ],
[ id: 128, ship_to: :MA, net_amount: 10.00 ],
[ id: 129, ship_to: :CA, net_amount: 102.00 ],
[ id: 120, ship_to: :NC, net_amount: 50.00 ] ]

PragProg.orders_with_total_amount(orders, tax_rates)

