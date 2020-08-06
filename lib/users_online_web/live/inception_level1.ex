defmodule UsersOnlineWeb.InceptionLevel1 do
  use UsersOnlineWeb, :live_view
  alias UsersOnline.OnlinePresence, as: Presence

  def render(assigns) do
    ~L"""
      Online users: <%= @reader_count %>
    """
  end

  def mount(_assigns, _session, socket) do
    topic = "oracle:neo"
    # before subscribing, let's get the current_reader_count
    initial_count = Presence.list(topic) |> map_size

    # Subscribe to the topic
    UsersOnlineWeb.Endpoint.subscribe(topic)

    # Track changes to the topic
    Presence.track(
      self(),
      topic,
      socket.id,
      %{}
    )

    {:ok, assign(socket, :reader_count, initial_count)}
  end

  def handle_info(
        %{event: "presence_diff", payload: %{joins: joins, leaves: leaves}},
        %{assigns: %{reader_count: count}} = socket
      ) do
    reader_count = count + map_size(joins) - map_size(leaves)

    {:noreply, assign(socket, :reader_count, reader_count)}
  end
end
