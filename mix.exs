defmodule PrintNode.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_printnode,
      version: "0.1.1",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ExPrintNode",
      description: "Small HTTPoison based wrapper around PrintNode API.",
      source_url: "https://github.com/vetspire/ex_printnode",
      package: package(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6.2"},
      {:jason, "~> 1.0"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:credo, "~> 1.5.0-rc.2", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/vetspire/ex_printnode"
      }
    ]
  end

  defp aliases do
    [
      lint: ["format --check-formatted", "credo --strict -a"]
    ]
  end
end
