defmodule PrintNode.Computers do
  @moduledoc """
  API interface for Computer operations
  """

  @spec list(String.t() | nil) :: {:error, String.t()} | {:ok, [%PrintNode.Resources.Computer{}]}
  def list(api_key \\ "") do
    PrintNode.Client.get!("/computers", PrintNode.Client.prepare_request_headers(api_key))
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&struct(PrintNode.Resources.Computer, &1))}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec get(String.t() | integer(), String.t() | nil) ::
          {:error, String.t()} | {:ok, [%PrintNode.Resources.Computer{}]}
  def get(computer_set, api_key \\ "") do
    PrintNode.Client.get!(
      "/computers/#{computer_set}",
      PrintNode.Client.prepare_request_headers(api_key)
    )
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&struct(PrintNode.Resources.Computer, &1))}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec delete :: none
  def delete() do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_computer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
