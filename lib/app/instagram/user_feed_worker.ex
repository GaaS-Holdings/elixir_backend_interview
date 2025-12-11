defmodule App.Instagram.UserFeedWorker do
  use Oban.Worker

  alias App.Instagram

  @impl true
  def perform(%Oban.Job{args: %{"username" => username}}) do
    with {:ok, json} <- Instagram.request_user_feed(username) do
      result = Enum.map(json["items"], &save_post!/1)
      Instagram.publish_posts!(result)
      :ok
    end
  end

  defp save_post!(post_json) do
    %{
      "caption" => caption,
      "media_type" => media_type,
      "mentions" => mentions,
      "shortcode" => shortcode,
      "taken_at" => taken_at
    } = post_json

    Instagram.save_post!(%{
      shortcode: shortcode,
      media_type: media_type,
      mentions: mentions,
      caption: caption,
      taken_at: taken_at
    })
  end
end
