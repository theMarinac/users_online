defmodule UsersOnline.OnlinePresence do
	use Phoenix.Presence, otp_app: :users_online, pubsub_server: UsersOnline.PubSub
end