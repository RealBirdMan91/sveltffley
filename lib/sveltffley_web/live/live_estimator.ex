defmodule SveltffleyWeb.LiveEstimator do
  use SveltffleyWeb, :live_view
  use LiveSvelte.Components

  def render(assigns) do
    ~H"""
    <.Estimator socket={@socket} tickets={@tickets} price={@price} />
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, tickets: 0, price: 3)
    {:ok, socket}
  end

  def handle_event("add", %{"price" => price}, socket) do
    {:noreply, update(socket, :tickets, &(&1 + price))}
  end

  def handle_event("substract", %{"price" => price}, socket) do
    {:noreply, update(socket, :tickets, &(&1 - price))}
  end

  def handle_event("set-price", %{"price" => price}, socket) do
    IO.inspect(price)
    {:noreply, assign(socket, price: String.to_integer(price))}
  end
end
