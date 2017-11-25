defmodule Countdown.ProjectManager do
  use Supervisor
  alias Countdown.{Scheduler, Laborer}

  def start_link(alarm) do
    {:ok, manager_pid} = Supervisor.start_link(__MODULE__, [alarm])
  end

  def init([alarm]) do
    children = [
      worker(Scheduler, [self, alarm], restart: :transient),
      worker(Laborer, [self], restart: :transient)
    ]

    supervise(children, strategy: :one_for_all)
  end

  def start_labor(manager_pid) do
    [{Laborer, laborer_pid, _, _,} | _tail] = Supervisor.which_children(manager_pid)
    GenServer.cast(laborer_pid, {:do_labor})
  end

end
