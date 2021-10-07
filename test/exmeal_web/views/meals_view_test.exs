defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory
  import Phoenix.View

  alias Exmeal.{Meal, User}
  alias ExmealWeb.MealsView

  test "render create.json" do
    user_params = build(:users_params)

    {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

    params = build(:meals_params, %{user_id: user_id})
    {:ok, %Meal{id: id} = meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20,
               date: ~N[2001-05-02 08:10:20],
               description: "Banana",
               id: ^id,
               user_id: ^user_id
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    user_params = build(:users_params)

    {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

    params = build(:meals_params, %{user_id: user_id})
    {:ok, %Meal{id: id} = meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20,
               date: ~N[2001-05-02 08:10:20],
               description: "Banana",
               id: ^id,
               user_id: ^user_id
             }
           } = response
  end
end
