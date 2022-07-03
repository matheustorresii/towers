defmodule Towers.Mock do
  def execute(%{"mock_path" => mock_path}, method) do
    mock_path
    |> handle_path(method)
  end

  defp handle_path(paths, method) do
    joined_path = paths
    |> Enum.join("_")

    "./lib/mocks/#{joined_path}_#{method}.json"
    |> File.read()
    |> handle_data()
  end

  defp handle_data({:ok, data}), do: handle_mock(data)

  defp handle_data({:error, _error}), do: {:error, "Mock not found! :("}

  defp handle_mock(data) do
    data
    |> Poison.decode()
    |> handle_parse()
  end

  defp handle_parse({:ok, %{"delay" => delay, "response" => response}}) do
    :timer.sleep(delay)
    {:ok, response}
  end

  defp handle_parse({:ok, response}), do: {:ok, response}

  defp handle_parse({:error, _error}), do: {:error, "Couldn't parse JSON! :("}
end
