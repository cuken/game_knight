defmodule GameKnight.Secrets do
  use AshAuthentication.Secret

  def secret_for([:authentication, :tokens, :signing_secret], GameKnight.Accounts.User, _opts) do
    Application.fetch_env(:game_knight, :token_signing_secret)
  end
end
