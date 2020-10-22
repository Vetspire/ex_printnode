defmodule PrintNode.Client do
  @moduledoc """
  Wrapper around HTTPoison for making the actual HTTP requests
  """

  use HTTPoison.Base

  def process_request_url(url) do
    "https://api.printnode.com" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!(keys: :atoms)
  end

  def process_request_headers(headers) do
    [{"Content-Type", "application/json"} | headers]
  end

  @spec prepare_request_headers(PrintNode.options()) :: [{<<_::104>>, <<_::48, _::_*8>>}, ...]
  def prepare_request_headers(api_key: api_key) do
    credentials = (api_key <> ":") |> Base.encode64()

    [{"Authorization", "Basic #{credentials}"}]
  end
end
