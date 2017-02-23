defmodule PhoenixGraphqlExample.PostResolver do
  alias PhoenixGraphqlExample.Repo
  alias PhoenixGraphqlExample.Post
 
  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end
end