defmodule UsersOnlineWeb.PageController do
	use UsersOnlineWeb, :controller 
	
	def index(conn, _params) do
		conn |> render("index.html")
	end
end