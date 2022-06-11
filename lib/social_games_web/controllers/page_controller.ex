defmodule SocialGamesWeb.PageController do
  use SocialGamesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
