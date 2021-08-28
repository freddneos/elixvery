defmodule Elixvery.Orders.ItemTest do
  use ExUnit.Case

  alias Elixvery.Orders.Item

  import Elixvery.Factory

  describe "build/4" do
    test "when all params are valid , return an item" do
      response = Item.build("pizza special", :pizza, "10.00", 1)
      expected_response = {:ok, build(:item)}
      assert response == expected_response
    end

    test "when there is an invalid category . returns an error" do
      response = Item.build("pizza special", :italian_food, "10.00", 1)
      expected_response = {:error, "Invalid Parameters"}
      assert response == expected_response
    end

    test "when there is an invalid price , returns an error" do
      response = Item.build("pizza special", :pizza, "10XX", 1)
      expected_response = {:error, "Invalid Price"}
      assert response == expected_response
    end

    test "where there is an invalid quantity , return an error" do
      response = Item.build("pizza special", :pizza, "10.00", 0)
      expected_response = {:error, "Invalid Parameters"}
      assert response == expected_response
    end
  end
end
