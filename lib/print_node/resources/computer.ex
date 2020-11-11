defmodule PrintNode.Resources.Computer do
  @moduledoc """
  Struct for PrintNode Computer resource
  """

  @behaviour Access

  defstruct [:createTimestamp, :hostname, :id, :inet, :inet6, :jre, :name, :state, :version]

  @spec get(%PrintNode.Resources.Computer{}, any, any) :: any
  defdelegate get(computer, key, default), to: Map

  @spec fetch(%PrintNode.Resources.Computer{}, any) :: :error | {:ok, any}
  defdelegate fetch(computer, key), to: Map

  @spec get_and_update(%PrintNode.Resources.Computer{}, any, (any -> :pop | {any, any})) ::
          {any, map}
  defdelegate get_and_update(computer, key, func), to: Map

  @spec pop(%PrintNode.Resources.Computer{}, any) :: {any, map}
  defdelegate pop(computer, key), to: Map
end
