defmodule Twittertwatter.PageController do
  use Twittertwatter.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
