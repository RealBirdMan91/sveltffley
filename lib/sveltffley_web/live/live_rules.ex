defmodule SveltffleyWeb.LiveRules do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components
  alias Sveltffley.Rules

  def render(assigns) do
    ~H"""
    <.Rules socket={@socket} emojis={@emojis} rules={@rules} />
    """
  end

  def mount(_params, _session, socket) do
    emojis = ~w"👋 🌍 🚀" |> Enum.random() |> String.duplicate(5)
    rules = Rules.list_rules()
    {:ok, assign(socket, rules: rules, emojis: emojis)}
  end
end
