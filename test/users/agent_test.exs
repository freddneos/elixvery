defmodule Elixvery.Users.AgentTest do
  use ExUnit.Case

  alias Elixvery.Users.Agent, as: UserAgent

  import Elixvery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when user is found , returns the user" do
      :user
      |> build(document: "123890123890")
      |> UserAgent.save()

      response = UserAgent.get("123890123890")

      expected_response =
        {:ok,
         %Elixvery.Users.User{
           address: "Rua Portugal",
           age: 31,
           document: "123890123890",
           email: "fredd@email.com",
           name: "Fredd"
         }}

      assert response == expected_response
    end

    test "when user is not found , returns an error" do
      response = UserAgent.get("00000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
