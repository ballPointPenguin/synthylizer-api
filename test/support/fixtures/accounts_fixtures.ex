defmodule Synthylizer.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Synthylizer.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        username: "some username"
      })
      |> Synthylizer.Accounts.create_user()

    # IO.inspect(user)

    user
  end
end
