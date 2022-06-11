defmodule SocialGamesWeb.IcebreakerLive do
  use SocialGamesWeb, :live_view

  def render(assigns) do
    ~L"""
      <h1>Icebreaker</h1>
    """
  end

  def mount(params, session, socket) do
    {:ok, assign(socket, :raised, 0)}
  end
end