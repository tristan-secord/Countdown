defmodule Countdown.Laborer do
  use GenServer

  def start_link(manager_pid) do
    GenServer.start_link(__MODULE__, [manager_pid])
  end

  #CALLBACKS

  def init([manager_pid]) do
    IO.puts "Started laborer"
    IO.inspect manager_pid

    {:ok, [manager_pid]}
  end

  def handle_cast({:do_labor}, [manager_pid]) do
    IO.puts "RUN FUNCTION!!!!!"
    {:noreply, [manager_pid]}
  end
end
