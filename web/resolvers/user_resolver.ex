defmodule PhoenixGraphqlExample.UserResolver do
  alias PhoenixGraphqlExample.Repo
  alias PhoenixGraphqlExample.User

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def update(%{id: id, user: user_params}, _info) do
    Repo.get!(User, id)
    |> User.update_changeset(user_params)
    |> Repo.update
  end

  def login(params, _info) do
    with {:ok, user} <- PhoenixGraphqlExample.Session.authenticate(params, Repo),
         {:ok, jwt, _ } <- Guardian.encode_and_sign(user, :access) do
      {:ok, %{token: jwt}}
    end
  end
end
