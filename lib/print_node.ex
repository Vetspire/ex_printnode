defmodule PrintNode do
  @moduledoc false

  @type options :: list(opt())
  @type opt :: {:api_key, String.t()} | {atom(), term()}
end
