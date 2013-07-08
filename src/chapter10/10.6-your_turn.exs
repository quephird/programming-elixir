defmodule FizzBuzz do
  def upto_with_case(n), do: (
    Enum.map 1..n, fizzbuzz_with_case &1
  )
  
  def fizzbuzz_with_case(n), do: (
    case {rem(n,3)==0, rem(n, 5)==0} do
      {true, true} -> "FizzBuzz"
      {false, true} -> "Buzz"
      {true, false} -> "Fizz"
      {_, _} -> n
    end
  )

  def upto_with_guards(n), do: (
    Enum.map 1..n, fizzbuzz_with_guards &1
  )
  
  def fizzbuzz_with_guards(n) when rem(n,15)==0, do: "FizzBuzz"
  def fizzbuzz_with_guards(n) when rem(n,3)==0, do: "Fizz"
  def fizzbuzz_with_guards(n) when rem(n,5)==0, do: "Buzz"
  def fizzbuzz_with_guards(n), do: n
end

FizzBuzz.fizzbuzz_with_case(1)
FizzBuzz.fizzbuzz_with_case(2)
FizzBuzz.fizzbuzz_with_case(3)
FizzBuzz.fizzbuzz_with_case(4)
FizzBuzz.fizzbuzz_with_case(5)
FizzBuzz.upto_with_case(20)

FizzBuzz.fizzbuzz_with_guards(1)
FizzBuzz.fizzbuzz_with_guards(2)
FizzBuzz.fizzbuzz_with_guards(3)
FizzBuzz.fizzbuzz_with_guards(4)
FizzBuzz.fizzbuzz_with_guards(5)
FizzBuzz.upto_with_guards(20)

defmodule MyBuiltin do
  def ok!(param), do: (
    case param do
      {:ok, data} -> data
      _ -> raise "Not ok!: #{inspect(param)}"
    end
  )
end  
