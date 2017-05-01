defmodule Final do
  use Application
  

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    
    children = [
        supervisor(Algo1.SubSupervisor, []),
        supervisor(Algo2.SubSupervisor, [])
    ]
    
    opts = [strategy: :rest_for_one, name: Final.Supervisor]
    
  Supervisor.start_link(children, opts)
  end
end