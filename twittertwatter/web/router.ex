defmodule Twittertwatter.Router do
  use Twittertwatter.Web, :router

  socket "/ws", Twittertwatter do
    channel "rooms:*", RoomChannel
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Twittertwatter do
    pipe_through :browser # Use the default browser stack

    get "/",    RoomsController, :show
    get "/:id", RoomsController, :show
  end



  # Other scopes may use custom stacks.
  # scope "/api", Twittertwatter do
  #   pipe_through :api
  # end
end
