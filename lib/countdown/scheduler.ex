defmodule Countdown.Scheduler do
  use GenServer
  alias Countdown.ProjectManager

  def start_link(manager_pid, alarm) do
    timeout = alarm
    |> Timex.Comparable.diff(Timex.now(), :milliseconds)

    GenServer.start_link(__MODULE__, [manager_pid, timeout])
  end

  #CALLBACKS

  def init([manager_pid, timeout]) do
    GenServer.cast(self(), {:start_timer})
    {:ok, [manager_pid, timeout]}
  end

  def handle_cast({:start_timer}, [manager_pid, timeout]) do
    :timer.sleep(timeout)
    ProjectManager.start_labor(manager_pid)
    {:noreply, [manager_pid, timeout]}
  end
  
end
