defmodule PrintNode.Resources.Printer do
  @moduledoc """
  Struct for PrintNode Printer resource
  """

  defstruct [:createTimestamp, :description, :id, :capabilities, :default, :state, :computer]
end
