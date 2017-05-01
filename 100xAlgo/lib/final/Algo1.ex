defmodule Final.Algo1 do  
    use GenServer
    	
	#####
	#API#
	#####
    
    def start_link(input_size) do
        GenServer.start_link(__MODULE__, random_list(input_size))
	end
    
    def sort_time(pid) do
        GenServer.cast(pid, {:sort}) 
	end
    
    ################
    #Implementation#
    ################
	
    def init(args)do
        { :ok, args }
	end
    
    def handle_cast({:sort}, list)do
        {t, _} = :timer.tc(fn -> make_pass(do_sort(list, []), list) end)
        IO.puts "input size is #{Enum.count(list)}"
        IO.puts "running time is #{t}"
        { :noreply, list}
	end
    
    ###################
    #private functions#
    ###################
    
    defp random_list(n) do
        1..n |> Enum.map(fn _ -> :rand.uniform(1000) end)
    end
    
    def make_pass(bubbled_list, bubbled_list) do
        bubbled_list
    end

    def make_pass(bubbled_list, _old_list) do
        do_sort(bubbled_list, []) |> make_pass(bubbled_list)
    end
    
    def do_sort(_list = [], _acc) do
        []
    end
  
    def do_sort([first|[]], acc) do
        acc ++ [first]
    end
  
    def do_sort([first,second|tail], acc) do
        [new_first, new_second] = swap(first, second)
        do_sort([new_second|tail], acc ++ [new_first])
    end
 
    defp swap(e1, e2) do
        if e1 <= e2 do [e1, e2] else [e2, e1] end
    end
    
end