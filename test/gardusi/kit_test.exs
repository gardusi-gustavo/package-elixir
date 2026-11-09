defmodule Gardusi.KitTest do
  use ExUnit.Case, async: true

  test "greets" do
    assert Gardusi.Kit.greet("Elixir") == "Hello, Elixir"
  end

  test "chunks" do
    assert Gardusi.Kit.chunk([1, 2, 3], 2) == [[1, 2], [3]]
  end
end
