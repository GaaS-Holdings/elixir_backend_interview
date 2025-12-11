defmodule App.Instagram do
  alias App.Repo
  alias App.Instagram.InstagramMedia

  def request_user_feed(username) do
    Req.get!("http://localhost:32123/proxy/apps/instagram-data-provider/user_feed/#{username}")
    |> case do
      %Req.Response{status: 200, body: body} ->
        {:ok, body}

      %Req.Response{} = response ->
        {:error, response}
    end
  end

  def save_post!(params) when is_map(params) do
    %InstagramMedia{}
    |> InstagramMedia.changeset(params)
    |> Repo.insert!()
  end

  def publish_posts!(posts) do
    Enum.map(posts, fn post ->
      Req.post!("http://localhost:32123/proxy/apps/mock-api/publish", json: serialize_post(post))
    end)
  end

  defp serialize_post(post) do
    %{
      shortcode: post.shortcode,
      caption: post.caption,
      media_type: post.media_type,
      mentions: post.mentions,
      taken_at: post.taken_at
    }
  end
end
