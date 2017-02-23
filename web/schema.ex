defmodule PhoenixGraphqlExample.Schema do
  use Absinthe.Schema
  import_types PhoenixGraphqlExample.Schema.Types
 
  query do
    field :posts, list_of(:post) do
      resolve &PhoenixGraphqlExample.PostResolver.all/2
    end
 
    field :users, list_of(:user) do
      resolve &PhoenixGraphqlExample.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &PhoenixGraphqlExample.UserResolver.find/2
    end
  end
end