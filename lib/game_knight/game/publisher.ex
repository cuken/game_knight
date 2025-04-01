defmodule GameKnight.Game.Publisher do
  use Ash.Resource,
    otp_app: :game_knight,
    domain: GameKnight.Game,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "publishers"
    repo GameKnight.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :website, :string do
      allow_nil? false
      public? true
    end

    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  relationships do
    has_many :games, GameKnight.Game.Game
  end
end
