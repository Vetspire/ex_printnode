defmodule PrintNode.Resources.PrintJob do
  @moduledoc """
  Struct for PrintNode PrintJob resource
  """

  @behaviour Access

  @enforce_keys [:title, :contentType, :content, :source]
  @derive Jason.Encoder

  defstruct [
    :id,
    :title,
    :content,
    :contentType,
    :source,
    :expireAt,
    :qty,
    :options,
    :authentication,
    :createTimestamp,
    :state,
    :printer
  ]

  @spec get(%PrintNode.Resources.PrintJob{}, any, any) :: any
  defdelegate get(printjob, key, default), to: Map

  @spec fetch(%PrintNode.Resources.PrintJob{}, any) :: :error | {:ok, any}
  defdelegate fetch(printjob, key), to: Map

  @spec get_and_update(%PrintNode.Resources.PrintJob{}, any, (any -> :pop | {any, any})) ::
          {any, map}
  defdelegate get_and_update(printjob, key, func), to: Map

  @spec pop(%PrintNode.Resources.PrintJob{}, any) :: {any, map}
  defdelegate pop(printjob, key), to: Map
end
