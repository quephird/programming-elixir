defmodule A do
  def foo do
    IO.puts "In A.foo()..."
  end
end

defmodule A.B do
  def bar do
    IO.puts "In A.B.bar()..."
    A.foo()
  end
end

defmodule A.B.C do
  def baz do
    IO.puts "In A.B.C.baz()..."
    A.B.bar()
  end
  
  def quux do
    baz()
  end
end

A.B.C.quux()

