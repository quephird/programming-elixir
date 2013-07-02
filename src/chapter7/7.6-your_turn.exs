defmodule MyList do
  def flatten([]), do: []
  
  def flatten([inner_list = [_h1 | _t1] | t2]), do: flatten(inner_list) ++ flatten(t2)

  def flatten([h | t]), do: [h] ++ flatten(t)
end

MyList.flatten([])
MyList.flatten([1])
MyList.flatten([[[[1]]]])
MyList.flatten([1, 2])
MyList.flatten([[[[1, 2]]]])
MyList.flatten([1,2,3,4,5,6])
MyList.flatten([1,2,[3,4,5,6]])
MyList.flatten([1,2,[3,4],5,6])
MyList.flatten([1,2,[[3,4],5,6]])

