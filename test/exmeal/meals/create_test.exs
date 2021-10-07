defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.{Error, Meal, User}

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

      params = build(:meals_params, %{user_id: user_id})

      {:ok, %Meal{id: id} = response} = Exmeal.create_meal(params)

      assert %Meal{
               calories: 20,
               date: ~N[2001-05-02 08:10:20],
               description: "Banana",
               id: ^id,
               user_id: ^user_id
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~N[2001-05-02 08:10:20]
      }

      response = Exmeal.create_meal(params)

      assert {:error, %Error{}} = response
    end
  end
end
