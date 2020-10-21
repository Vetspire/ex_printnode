defmodule PrintNode.Client do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://api.printnode.com" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!(keys: :atoms)
  end

  def process_request_headers(headers) do
    credentials = (Application.get_env(:ex_printnode, :api_key) <> ":") |> Base.encode64()

    [{"Content-Type", "application/json"}, {"Authorization", "Basic #{credentials}"} | headers]
  end
end
