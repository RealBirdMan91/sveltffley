defmodule SveltffleyWeb.LiveRules do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components

  def render(assigns) do
    ~H"""
    <.Rules socket={@socket} emojis={@emojis} />
    """
  end

  def mount(_params, _session, socket) do
    emojis = ~w"👋 🌍 🚀" |> Enum.random() |> String.duplicate(5)
    {:ok, assign(socket, emojis: emojis)}
  end
end
