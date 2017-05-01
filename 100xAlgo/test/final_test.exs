defmodule FinalTest do
  use ExUnit.Case
  doctest Final

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "Algo1 sort" do
  	list = [15,25,1,91,225,35]
  	sorted = Final.Algo1.make_pass(Final.Algo1.do_sort(list, []), list)
  	assert sorted == [1,15,25,35,91,225]
  end

  test "Algo2 sort" do
    list = [15,25,1,91,225,35]
	  sorted = Final.Algo2.sorting(list)
    assert sorted == [1,15,25,35,91,225]
  end  
  
  test "non negative running times" do
    {t1, sorted} = :timer.tc(fn -> Final.Algo1.make_pass(Final.Algo1.do_sort([ ], [ ]), [ ]) end)
    assert t1>=0
    {t2, _} = :timer.tc(fn -> Final.Algo2.sorting([]) end)
    assert t2>=0
  end

  test "starts at large values" do
    assert {:ok, pid1} = Final.Algo1.start_link(1000000)
    assert {:ok, pid2} = Final.Algo2.start_link(9999999) 
  end


end