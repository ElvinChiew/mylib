defmodule MyLibWeb.UserLive.Show do
  alias MyLib.Library
  use MyLibWeb, :live_view

  alias MyLib.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    user = Accounts.get_user!(id, preload: [loan: :book])
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:user, user)}
  end

  defp page_title(:show), do: "Show User"
  defp page_title(:edit), do: "Edit User"
end
