defmodule SveltffleyWeb.LiveRaffle.Index do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components

  alias Sveltffley.Raffles

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    IO.inspect(params)
    IO.inspect(socket)
    socket = socket |> assign(:raffles, Raffles.filter_raffles(params)) |> assign(:params, params)

    {:noreply, socket}
  end

  def handle_event("filter", params, socket) do
    params =
      params
      |> Map.take(~w(query status sort_by))
      |> Map.reject(fn {_, v} -> v in ["", nil] end)

    socket = push_patch(socket, to: ~p"/raffles?#{params}")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.RafflesList
      socket={@socket}
      raffles={@raffles}
      params={
        %{
          query: @params["query"] || "",
          status: @params["status"] || "",
          sort_by: @params["sort_by"] || ""
        }
      }
    />
    """
  end
end
