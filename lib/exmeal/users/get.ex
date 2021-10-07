defmodule Exmeal.Users.Get do
  alias Exmeal.{Error, Repo, User}

  def by_id(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
