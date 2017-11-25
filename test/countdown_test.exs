defmodule CountdownTest do
  use ExUnit.Case
  doctest Countdown

  test "greets the world" do
    assert Countdown.hello() == :world
  end
end
