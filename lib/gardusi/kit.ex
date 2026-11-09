defmodule Gardusi.Kit do
  @moduledoc "Small, framework-free helpers for BEAM services."

  @doc "Returns a greeting."
  def greet(name) when is_binary(name), do: "Hello, #{name}"

  @doc "Splits a list into fixed-size chunks."
  def chunk(items, size) when is_list(items) and is_integer(size) and size > 0 do
    Enum.chunk_every(items, size)
  end
end
