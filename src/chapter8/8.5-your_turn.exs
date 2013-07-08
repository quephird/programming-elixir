defmodule MyIO do
  def center(string_list), do: (
    max_length = Enum.map(string_list, String.length &1) |> Enum.max
    Enum.each string_list, _center(&1, max_length)
  )
  
# This is really hacky; there is no builtin for padding strings,
# and I am otherwise not familiar enough with the Elixir libraries
# to come up with anything more elegant.

  defp _center(string, width), do: (
    pad = div(width-String.length(string),2)
    if pad > 0, do:
      Enum.each 1..pad, fn _n -> IO.write " " end
    IO.puts string
  )
end

MyIO.center ["cat", "zebra", "elephant", "cuttlefish", "ocelot", "platypus", "hippopotamus", "dog", "snake", "jellyfish", "chimpanzee" ]

