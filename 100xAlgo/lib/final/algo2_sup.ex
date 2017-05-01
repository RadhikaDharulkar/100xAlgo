defmodule Algo2.SubSupervisor do
	use Supervisor

	def start_link do
		Supervisor.start_link(__MODULE__, :ok, name: Algo2.SubSupervisor)
	end
	  
	def init(:ok) do
	    children = [
	    	worker(Final.Algo2, [], restart: :temporary)
	    ]
	    supervise(children, strategy: :simple_one_for_one)
	end
	  
	def run_algo(n) do
		{:ok, pid} = Supervisor.start_child(Algo2.SubSupervisor, [n])
		pid
	end
	
end	

