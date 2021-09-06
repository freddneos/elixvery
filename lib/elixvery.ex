defmodule Elixvery do
  alias Elixvery.Users.Agent, as: UserAgent
  alias Elixvery.Orders.Agent, as: OrderAgent

  alias Elixvery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Elixvery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
end
