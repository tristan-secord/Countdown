defmodule Countdown.CountdownSupervisor do
  use Supervisor
  alias Countdown.ProjectManager

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: :countdown_supervisor)
  end

  def init([]) do
    children = [
      worker(ProjectManager, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
