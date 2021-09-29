defmodule SynthylizerWeb.PageController do
  use SynthylizerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
