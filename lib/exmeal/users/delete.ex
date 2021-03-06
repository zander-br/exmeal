defmodule Exmeal.Users.Delete do
  alias Exmeal.{Error, Repo, User}

  def call(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
