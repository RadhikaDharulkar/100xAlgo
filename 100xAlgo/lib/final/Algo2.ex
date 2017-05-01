defmodule Final.Algo2 do  
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
        {t, _} = :timer.tc(fn -> sorting(list) end)
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
    
    def sorting([]), do: []
    
    def sorting([pivot | rest]) do
        { left, right } = Enum.partition(rest, &(&1 < pivot))
        sorting(left) ++ [pivot | sorting(right)]
    end
    
    
end