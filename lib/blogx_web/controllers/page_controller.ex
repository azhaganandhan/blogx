defmodule BlogxWeb.PageController do
  use BlogxWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def health_check(conn, _params) do
    send_resp(conn, 200, "OK")
  end
end
