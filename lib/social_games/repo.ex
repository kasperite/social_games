defmodule SocialGames.Repo do
  use Ecto.Repo,
    otp_app: :social_games,
    adapter: Ecto.Adapters.Postgres
end
