defmodule MyString do
  def printable?(string), do:
    Enum.all? string, fn e -> e>=32 && e<=126 end

  def anagram?(word1, word2), do:
    Enum.sort(word1)==Enum.sort(word2)
end

MyString.printable?('elixir')
MyString.printable?('ELIXIR')
MyString.printable?('123456')
MyString.printable?('elixir is pretty cool')
MyString.printable?('elixir\tis\tpretty\tcool')

MyString.anagram?('dog', 'god')
MyString.anagram?('elixir', 'ruby')

['cat' | 'dog']
# The above yields ['cat', 100, 111, 103] because 'cat' is entirely
# cons'ed onto the list of the characters of the string 'dog'.
# If the desired result is the concatenation of the two strings,
# then one would need to enter the following:
'cat' ++ 'dog'

defmodule MyCalculator do
  def calculate(string_expression), do: ( 
    [o1, op, o2] = %w"#{string_expression}"
    _calculate(binary_to_integer(o1), op, binary_to_integer(o2))
  )
  
  defp _calculate(o1, op, o2) when op=="+", do: o1+o2
  defp _calculate(o1, op, o2) when op=="-", do: o1-o2
end

MyCalculator.calculate "2 + 2"
MyCalculator.calculate "123 + 27"
MyCalculator.calculate "123 - 27"

