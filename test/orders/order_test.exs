defmodule Elixvery.Orders.OrderTest do
  use ExUnit.Case

  alias Elixvery.Orders.Order

  import Elixvery.Factory

  describe "build/2" do
    test "when all params are valid , return an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "cheese burguer",
          category: :hamburguer,
          quantity: 2,
          unity_price: Decimal.new("5.00")
        )
      ]

      response = Order.build(user, items)
      # {:ok, build(:item)}
      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when the quantity is invalid , return an error" do
      user = build(:user)
      items = []

      response = Order.build(user, items)
      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
