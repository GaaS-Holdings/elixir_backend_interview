defmodule AppWeb.InstagramController do
  use AppWeb, :controller

  alias App.Instagram.UserFeedWorker

  def user_feed(conn, params) do
    %{"username" => username} = params

    %{"username" => username}
    |> UserFeedWorker.new()
    |> Oban.insert!()

    json(conn, %{"success" => true})
  end
end
