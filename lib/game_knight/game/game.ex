defmodule GameKnight.Game.Game do
  use Ash.Resource,
    otp_app: :game_knight,
    domain: GameKnight.Game,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "games"
    repo GameKnight.Repo
  end

  actions do
    create :create do
      accept [:name]
    end

    read :read do
      primary? true
    end

    update :update do
      accept [:name]
    end

    destroy :destroy do
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    create_timestamp :inserted_at
    update_timestamp :updated_at
  end
end
