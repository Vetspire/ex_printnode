defmodule PrintNode.Computers do
  @moduledoc """
  API interface for Computer operations
  """

  def list() do
    PrintNode.Client.get!("/computers")
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&struct(PrintNode.Resources.Computer, &1))}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  def get(computer_set) do
    PrintNode.Client.get!("/computers/#{computer_set}")
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&struct(PrintNode.Resources.Computer, &1))}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  def delete() do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_computer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
