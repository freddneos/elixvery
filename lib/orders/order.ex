defmodule Elixvery.Orders.Order do
  alias Elixvery.Users.User
  alias Elixvery.Orders.Item
  @keys [:user_document, :delivery_address, :items, :total_price]
  @enforce_keys @keys

  defstruct @keys

  def build(%User{document: document, address: address}, [%Item{} | _items] = items) do
    {:ok,
     %__MODULE__{
       user_document: document,
       delivery_address: address,
       items: items,
       total_price: calculate_total_price(items)
     }}
  end

  def build(%User{document: _document, address: _address}, _items) do
    {:error, "Invalid Parameters"}
  end

  defp calculate_total_price(items) do
    Enum.reduce(items, Decimal.new("0.00"), &sum_prices(&1, &2))
  end

  defp sum_prices(%Item{unity_price: price, quantity: quantity}, acc) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(acc)
  end
end
