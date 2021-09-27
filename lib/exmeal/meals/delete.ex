defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Error, Meal, Repo}

  def call(uuid) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, Error.build_meat_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
