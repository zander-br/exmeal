defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @params [:name, :cpf, :email]

  @derive {Jason.Encoder, only: [:id, :name, :cpf, :email]}

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @params)
    |> validate_required(@params)
  end
end
