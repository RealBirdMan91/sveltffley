defmodule SveltffleyWeb.LiveRaffle.Index do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components

  alias Sveltffley.Raffles

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    IO.inspect(params)
    socket = assign(socket, :raffles, Raffles.filter_raffles(params))
    {:noreply, socket}
  end

  def handle_event("filter", params, socket) do
    IO.inspect(params)

    params =
      params
      |> Map.take(~w(query status sort_by))
      |> Map.reject(fn {_, v} -> v in ["", nil] end)

    socket = push_patch(socket, to: ~p"/raffles?#{params}")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.RafflesList socket={@socket} raffles={@raffles} />
    """
  end
end
