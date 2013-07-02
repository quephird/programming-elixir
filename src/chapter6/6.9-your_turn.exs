IO.puts :io_lib.format("~.2f", [3.1415926536])
IO.puts :io_lib.format("~.2f", [123.456])

IO.puts System.get_env("HOME")
IO.puts System.get_env("PROCESSOR_ARCHITECTURE")

IO.puts Path.extname("/foo/bar/baz/quux.doc")
IO.puts Path.extname("c:\\My LOLcat pictures\\wtf.jpg")

IO.puts System.cwd()

IO.puts System.cmd("dir")
IO.puts System.cmd("echo HELLO OS!!!!")

