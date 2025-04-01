defmodule GameKnight.Game do
  use Ash.Domain,
    otp_app: :game_knight

  resources do
    resource GameKnight.Game.Game
  end
end
