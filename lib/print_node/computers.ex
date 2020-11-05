defmodule PrintNode.Computers do
  @moduledoc """
  API interface for Computer operations
  """

  alias PrintNode.Client
  alias PrintNode.Resources.Computer

  @spec list(PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%Computer{}]}
  def list(options) do
    Client.get!("/computers", Client.prepare_request_headers(options))
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&struct(Computer, &1))}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec get(String.t() | integer(), PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%Computer{}]}
  def get(computer_set, options) do
    Client.get!(
      "/computers/#{computer_set}",
      Client.prepare_request_headers(options)
    )
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&struct(Computer, &1))}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec delete :: none
  def delete do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_computer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
