defmodule App.Instagram.InstagramMedia do
  use Ecto.Schema

  import Ecto.Changeset

  schema "instagram_medias" do
    field :shortcode, :string
    field :caption, :string
    field :media_type, Ecto.Enum, values: [:post, :reel, :carousel]
    field :mentions, {:array, :string}
    field :taken_at, :integer

    timestamps()
  end

  def changeset(instagram_media, params) do
    instagram_media
    |> cast(params, [:shortcode, :caption, :media_type, :mentions, :taken_at])
    |> validate_required([:shortcode, :caption, :media_type, :mentions, :taken_at])
  end
end
