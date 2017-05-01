defmodule Final.Project do  
	
	def start_project do
		IO.puts "Welcome to the project '100xAlgo' "
		IO.puts "1.Bubble sort...Complexity theta(n^2)"
		IO.puts "2.Quick sort...Complexity on theta(lg n)"
		option = IO.gets "Please select a number corresponding to the above list"
		option = option |>String.trim() 
		 		  		|> String.to_integer()

		cond do
			option == 1 ->
				IO.puts "Algo1:  Bubble sort   <<please input the range of input sizes that you want running times to>>"
				min = IO.gets "minimun: " 
				min = min |> String.trim() 
						  |> String.to_integer()
				max = IO.gets "maximum: "
				max = max |> String.trim() 
						  |> String.to_integer()
				for x<-1..100 do                   
					input_size = (:rand.uniform((max - min) + 1)) -1 +min
					
					pid = Algo1.SubSupervisor.run_algo(input_size)
			
					Final.Algo1.sort_time(pid)
					
				end

			option == 2 ->
				IO.puts "Algo2:  Quick sort   <<please input the range of input sizes that you want running times to>>"
				min = IO.gets "minimun: " 
				min = min |> String.trim() 
						  |> String.to_integer()
				max = IO.gets "maximum: "
				max = max |> String.trim() 
						  |> String.to_integer()
				for x<-1..100 do                   
					input_size = (:rand.uniform((max - min) + 1)) -1 +min
					
					pid = Algo2.SubSupervisor.run_algo(input_size)
			
					Final.Algo2.sort_time(pid)
					
				end

			true ->
				"start again and enter a valid option"
		end

	end

end 