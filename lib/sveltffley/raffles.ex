defmodule Sveltffley.Raffle do
  @derive Jason.Encoder
  defstruct [:id, :prize, :ticket_price, :status, :image_path, :description]
end

defmodule Sveltffley.Raffles do
  def list_raffles do
    [
      %Sveltffley.Raffle{
        id: 1,
        prize: "Autographed Jersey",
        ticket_price: 2,
        status: :open,
        image_path: "/images/jersey.jpg",
        description: "Step up, sports fans!"
      },
      %Sveltffley.Raffle{
        id: 2,
        prize: "Coffee With A Yeti",
        ticket_price: 3,
        status: :upcoming,
        image_path: "/images/yeti-coffee.jpg",
        description: "A super-chill coffee date."
      },
      %Sveltffley.Raffle{
        id: 3,
        prize: "Vintage Comic Book",
        ticket_price: 1,
        status: :closed,
        image_path: "/images/comic-book.jpg",
        description: "A rare collectible!"
      }
    ]
  end

  def get_raffle(id) when is_integer(id) and id > 0 do
    Enum.find(list_raffles(), &(&1.id == id))
  end

  def get_raffle(id) when is_binary(id) do
    id
    |> String.to_integer()
    |> get_raffle()
  end

  def get_raffle(_), do: nil

  def featured_raffles(raffle) do
    list_raffles() |> List.delete(raffle)
  end
end
