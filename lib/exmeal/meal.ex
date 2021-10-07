defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @params [:description, :date, :calories, :user_id]

  @derive {Jason.Encoder, only: [:calories, :date, :description, :id, :user_id]}

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @params)
    |> validate_required(@params)
    |> validate_number(:calories, greater_than: 0)
  end
end
