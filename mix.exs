defmodule LocalvoreCredoChecks.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :localvore_credo_checks,
     version: @version,
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps()]
  end

  def application do
    []
  end

  defp deps do
    [
      {:credo, "~> 0.7"},
      {:faker, "~> 0.6", only: [:dev, :test]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp package do
    [
      contributors: ["Sean Callan"],
      files: ~w(lib mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{
        github: "https://github.com/localvore-today/localvore-credo-checks.git"
      }
    ]
  end
end
