defmodule Sveltffley.Raffles.Raffle do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, except: [:__meta__]}

  schema "raffles" do
    field :status, Ecto.Enum, values: [:upcoming, :open, :closed]
    field :description, :string
    field :prize, :string
    field :ticket_price, :integer
    field :image_path, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(raffle, attrs) do
    raffle
    |> cast(attrs, [:prize, :description, :ticket_price, :status, :image_path])
    |> validate_required([:prize, :description, :ticket_price, :status, :image_path])
  end
end