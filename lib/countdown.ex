defmodule Countdown do
  alias Countdown.{
    CountdownSupervisor,
    Scheduler,
    Laborer
  }
  @moduledoc """
  Documentation for Countdown.
  """

  # Called when application using countdown is started
  # Will return the countdown supervisor pid -> add name so dont have to remember pid
  def start do
    CountdownSupervisor.start_link
  end

  # Called from the application when we want to start the timer.
  # This will create the manager and children from the countdown supervisor
  #####!!!!!! MAKE SURE ALARM IS DATETIME OTHERWISE FAIL!!!!!!######
  def create_project(alarm) do
    Supervisor.start_child(:countdown_supervisor, [alarm])
  end
end



#EACH INSTANCE IS A PROJECT

#Library Tree

# Countdown Supervisor
    # Project Manager
        # Scheduler
        # Laborer
    # Project Manager
        # Scheduler
        # Laborer
    # Project Manager
        # Scheduler
        # Laborer
####...


# App starts ->
# 1. Start Supervisor
# Want to start a new project ->
# 2. Start new project manager, scheduler and laborer
# 3. Scheduler starts timer. Once timer is complete - calls start labor in supervisor
# 4. Supervisor gets laborer PID, and calls start labor -> which runs function
# 5. Once complete Laborer calls complete
