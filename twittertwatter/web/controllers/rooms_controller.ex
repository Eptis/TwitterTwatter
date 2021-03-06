defmodule Twittertwatter.RoomsController do
  use Twittertwatter.Web, :controller

  @default_room "Lobby"
  plug :action

  @doc "shows a specific room with room_id specified"
  def show(conn, %{ "id" => room_id }) do
    conn |> render_room room_id
  end

  @doc "shows a default room -- Lobby"
  def show(conn, _params) do
    conn |> render_room @default_room
  end


  # renders the room with given ID
  defp render_room(conn, room_id) do
    conn |> render :show, room_id: room_id
  end
end
