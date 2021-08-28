defmodule Elixvery.Factory do
  use ExMachina
  alias Elixvery.Users.User
  alias Elixvery.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "Rua Portugal",
      age: 31,
      document: "123123",
      email: "fredd@email.com",
      name: "Fredd"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "pizza special",
      quantity: 1,
      unity_price: Decimal.new("10.00")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua Portugal",
      items: [
        build(:item),
        build(:item,
          category: :hamburguer,
          description: "cheese burguer",
          quantity: 2,
          unity_price: Decimal.new("5.00")
        )
      ],
      total_price: Decimal.new("20.00"),
      user_document: "123123"
    }
  end
end
