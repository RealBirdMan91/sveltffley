defmodule SveltffleyWeb.LiveRaffle.Show do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components

  alias Sveltffley.Raffles

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    raffle = Raffles.get_raffle!(id)

    socket =
      socket
      |> assign(:raffle, raffle)
      |> assign(:page_title, raffle.prize)
      |> assign(:featured_raffles, Raffles.featured_raffles(raffle))

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.SingleRaffle socket={@socket} raffle={@raffle} featured_raffles={@featured_raffles} />
    """
  end
end
