defmodule PrintNode.Resources.PrintJob do
  @moduledoc """
  Struct for PrintNode PrintJob resource
  """

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
end
