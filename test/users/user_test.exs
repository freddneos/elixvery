defmodule Elixvery.Users.UserTest do
  use ExUnit.Case

  alias Elixvery.Users.User

  import Elixvery.Factory

  describe "build/5" do
    test "when all params are valid , return the user" do
      response =
        User.build(
          "Fredd",
          "fredd@email.com",
          "123123",
          31,
          "Rua Portugal"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when a parameter is invalid , return the error" do
      response =
        User.build(
          "Fredd Jr.",
          "fredd@email.com",
          "123123",
          6,
          "Rua Portugal"
        )

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
