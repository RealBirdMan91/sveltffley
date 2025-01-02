defmodule SveltffleyWeb.LiveRaffle.Show do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components
  require Logger
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
      |> assign_async(:featured_raffles, fn ->
        {:ok, %{featured_raffles: Raffles.featured_raffles(raffle)}}
      end)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.SingleRaffle
      socket={@socket}
      raffle={@raffle}
      featured_raffles={
        %{
          loading: @featured_raffles.loading,
          failed: @featured_raffles.failed,
          result: @featured_raffles.result
        }
      }
    />
    """
  end
end
