defmodule PrintNode.Resources.Printer do
  @moduledoc """
  Struct for PrintNode Printer resource
  """

  @behaviour Access

  defstruct [
    :createTimestamp,
    :name,
    :description,
    :id,
    :capabilities,
    :default,
    :state,
    :computer
  ]

  @spec get(%PrintNode.Resources.Printer{}, any, any) :: any
  defdelegate get(printer, key, default), to: Map

  @spec fetch(%PrintNode.Resources.Printer{}, any) :: :error | {:ok, any}
  defdelegate fetch(printer, key), to: Map

  @spec get_and_update(%PrintNode.Resources.Printer{}, any, (any -> :pop | {any, any})) ::
          {any, map}
  defdelegate get_and_update(printer, key, func), to: Map

  @spec pop(%PrintNode.Resources.Printer{}, any) :: {any, map}
  defdelegate pop(printer, key), to: Map
end
