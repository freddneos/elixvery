defmodule Elixvery.Users.CreateOrUpdate do
  alias Elixvery.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{name: name, address: address, email: email, document: document, age: age}) do
    name
    |> User.build(email, document, age, address)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)
    {:ok, "User saved or updated successfully"}
  end

  defp save_user({:error, _reason} = error), do: error
end
