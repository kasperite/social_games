defmodule SocialGamesWeb.IcebreakerLive do
  use SocialGamesWeb, :live_view

  @topic "auction"

  def mount(_params, _session, socket) do
    SocialGamesWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _, socket) do
    # val = &(&1 + 1)
    val = socket.assigns.val + 1
    SocialGamesWeb.Endpoint.broadcast_from(self(), @topic, "changed", val)
    # {:noreply, update(socket, :val, val)}
    {:noreply, assign(socket, :val, val)}
  end

  def handle_event("dec", _, socket) do
    # val = &(&1 - 1)
    val = socket.assigns.val - 1
    SocialGamesWeb.Endpoint.broadcast_from(self(), @topic, "changed", val)
    # {:noreply, update(socket, :val, val)}
    {:noreply, assign(socket, :val, val)}
  end

  def handle_info(%{topic: @topic, payload: val}, socket) do
    {:noreply, assign(socket, :val, val)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <button phx-click="dec">-</button>
      <button phx-click="inc">+</button>
    </div>
    """
  end
end