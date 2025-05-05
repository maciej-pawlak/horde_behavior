defmodule NodeListener do
  use GenServer

  def start_link(_), do: GenServer.start_link(__MODULE__, [])

  def init(_) do
    :net_kernel.monitor_nodes(true, node_type: :visible)
    {:ok, nil}
  end

  def handle_info({:nodeup, node, node_type}, state) do
    IO.inspect("Node up: #{inspect(node)}")
    IO.inspect("Node type: #{inspect(node_type)}")
    set_members(HordeRegistry)
    set_members(HordeSupervisor)
    {:noreply, state}
  end

  def handle_info({:nodedown, _node, _node_type}, state) do
    set_members(HordeRegistry)
    set_members(HordeSupervisor)
    {:noreply, state}
  end

  defp set_members(name) do
    members =
      [Node.self() | Node.list()]
      |> Enum.map(fn node -> {name, node} end)

    IO.inspect(members, label: "Members:")

    :ok = Horde.Cluster.set_members(name, members)
  end
end
