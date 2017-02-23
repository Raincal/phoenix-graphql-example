defmodule PhoenixGraphqlExample.PageController do
  use PhoenixGraphqlExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
