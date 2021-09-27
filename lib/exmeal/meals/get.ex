defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id(uuid) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, Error.build_meat_not_found_error()}
      meal -> {:ok, meal}
    end
  end
end
