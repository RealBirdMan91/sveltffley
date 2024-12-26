defmodule SveltffleyWeb.LiveRaffle.Index do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components

  alias Sveltffley.Raffles

  def mount(_params, _session, socket) do
    socket = assign(socket, :raffles, Raffles.list_raffles())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.RafflesList socket={@socket} raffles={@raffles} />
    """
  end
end
