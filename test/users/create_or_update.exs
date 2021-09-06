defmodule Elixvery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Elixvery.Users.Agent, as: UserAgent
  alias Elixvery.Users.CreateOrUpdate

  import Elixvery.Factory

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid ,saves the user" do
      params = %{
        address: "Rua Portugal",
        age: 31,
        document: "123890123890",
        email: "fredd@email.com",
        name: "Fredd"
      }

      response = CreateOrUpdate.call(params)
      expected_response = {:ok, "User saved or updated successfully"}
      assert response == expected_response
    end

    test "when some  params are invalid ,returns error" do
      params = %{
        address: "Rua Portugal",
        age: 12,
        document: "123890123890",
        email: "fredd@email.com",
        name: "Fredd"
      }

      response = CreateOrUpdate.call(params)
      expected_response = {:error, "Invalid Parameters"}
      assert response == expected_response
    end
  end
end
