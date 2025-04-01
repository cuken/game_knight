defmodule GameKnight.Accounts do
  use Ash.Domain, otp_app: :game_knight, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource GameKnight.Accounts.Token
    resource GameKnight.Accounts.User
  end
end
