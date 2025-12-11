defmodule App.Repo.Migrations.CreateInstagramMedias do
  use Ecto.Migration

  def change do
    create table(:instagram_medias) do
      add :shortcode, :string
      add :caption, :string
      add :media_type, :string
      add :mentions, {:array, :string}
      add :taken_at, :integer

      timestamps()
    end
  end
end
