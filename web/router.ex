defmodule PhoenixGraphqlExample.Router do
  use PhoenixGraphqlExample.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixGraphqlExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug,
    schema: PhoenixGraphqlExample.Schema
  
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: PhoenixGraphqlExample.Schema

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixGraphqlExample do
  #   pipe_through :api
  # end
end