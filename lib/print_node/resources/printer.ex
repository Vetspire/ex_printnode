defmodule PrintNode.Resources.Printer do
  @moduledoc """
  Struct for PrintNode Printer resource
  """

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
end
