defmodule PrintNode.Resources.Computer do
  @moduledoc """
  Struct for PrintNode Computer resource
  """

  defstruct [:createTimestamp, :hostname, :id, :inet, :inet6, :jre, :name, :state, :version]
end
