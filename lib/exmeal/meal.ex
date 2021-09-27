defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @params [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:calories, :date, :description, :id]}

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :integer

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @params)
    |> validate_required(@params)
    |> validate_number(:calories, greater_than: 0)
  end
end
