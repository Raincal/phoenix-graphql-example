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
  end

  input_object :update_user_params do
    field :name, :string
    field :email, :string
    field :password, :string
  end

  input_object :update_post_params do
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :user_id, non_null(:integer)
  end

  mutation do
    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve &PhoenixGraphqlExample.UserResolver.update/2
    end

    field :login, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &PhoenixGraphqlExample.UserResolver.login/2
    end

    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve &PhoenixGraphqlExample.PostResolver.create/2
    end

    field :update_post, type: :post do
      arg :id, non_null(:integer)
      arg :post, :update_post_params

      resolve &PhoenixGraphqlExample.PostResolver.update/2
    end

    field :delete_post, type: :post do
      arg :id, non_null(:integer)

      resolve &PhoenixGraphqlExample.PostResolver.delete/2
    end
  end
end
