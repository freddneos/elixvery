defmodule Elixvery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  alias Elixvery.Orders.Agent, as: OrderAgent
  alias Elixvery.Orders.CreateOrUpdate

  import Elixvery.Factory

  describe "call/1" do
    setup do
      OrderAgent.start_link(%{})
      :ok
    end

    document = "123123123"
    user = build(:user, document: document)

    UserAgent.save(user)

    item1 = %{
      category: :pizza,
      description: "pizza special",
      quantity: 1,
      unity_price: "15.00"
    }

    item2 = %{
      category: :pizza,
      description: "pizza calabresa",
      quantity: 1,
      unity_price: "12.00"
    }

    #

    # test "when all params are valid ,saves the user" do
    #   params = %{
    #     address: "Rua Portugal",
    #     age: 31,
    #     document: "123890123890",
    #     email: "fredd@email.com",
    #     name: "Fredd"
    #   }

    #   response = CreateOrUpdate.call(params)
    #   expected_response = {:ok, "User saved or updated successfully"}
    #   assert response == expected_response
    # end

    # test "when some  params are invalid ,returns error" do
    #   params = %{
    #     address: "Rua Portugal",
    #     age: 12,
    #     document: "123890123890",
    #     email: "fredd@email.com",
    #     name: "Fredd"
    #   }

    #   response = CreateOrUpdate.call(params)
    #   expected_response = {:error, "Invalid Parameters"}
    #   assert response == expected_response
    # end
  end
end
