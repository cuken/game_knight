defmodule GameKnight.Game do
  use Ash.Domain, otp_app: :game_knight, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource GameKnight.Game.Game do
      define :create_game, action: :create
      define :read_games, action: :read
      define :get_game_by_id, action: :read, get_by: :id
      define :update_game, action: :update
      define :destroy_game, action: :destroy
    end
  end
end
