defmodule HordeBehavior.MixProject do
  use Mix.Project

  def project do
    [
      app: :horde_behavior,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HordeBehavior.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:horde, "~> 0.8.7"},
      # {:horde, "~> 0.9.0"},
      {:horde, github: "maciej-pawlak/horde", tag: "v0.8.3-fix"},

      {:libcluster, "~> 3.3"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
