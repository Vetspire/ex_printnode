defmodule PrintNodeTest do
  use ExUnit.Case
  doctest PrintNode

  test "greets the world" do
    assert PrintNode.hello() == :world
  end
end
