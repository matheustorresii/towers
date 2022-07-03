defmodule TowersWeb.MockController do
  use TowersWeb, :controller

  alias Towers.Mock

  def get(conn, params), do: index(conn, params, "get")

  def post(conn, params), do: index(conn, params, "post")

  def put(conn, params), do: index(conn, params, "put")

  def delete(conn, params), do: index(conn, params, "delete")

  defp index(conn, params, method) do
    params
    |> Mock.execute(method)
    |> handle_response(conn)
  end

  defp handle_response({:ok, result}, conn), do: handle_response(conn, result, :ok)

  defp handle_response({:error, result}, conn), do: handle_response(conn, result, :bad_request)

  defp handle_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(result)
  end
end
