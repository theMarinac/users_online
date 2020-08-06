defmodule UsersOnlineWeb.PageLive do
  use UsersOnlineWeb, :live_view

  def render(assigns) do
    ~L"""
      <%= live_render(@socket, UsersOnlineWeb.InceptionLevel1, id: "InceptionLevel1") %>
    """
  end
end
