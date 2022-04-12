defmodule Picota do
  import Plug.Conn
  require Logger
  def init(options) do options end

  @spec call(Plug.Conn.t(), any) :: Plug.Conn.t()
  def call(conn, _options) do
    Logger.info("Request resived")
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "health")
  end
end
