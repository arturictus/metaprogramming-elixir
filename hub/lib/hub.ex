defmodule Hub do
  HTTPotion.start
  @username "arturictus"

  "https://api.github.com/users/#{@username}/repos"
  |> HTTPotion.get(headers: ["User-Agent": "Elixir"])
  |> Map.get(:body)
  |> Poison.decode!
  |> Enum.each(fn repo ->
       def unquote(String.to_atom(repo["name"]))() do
         unquote(Macro.escape(repo))
       end
     end)

  def go(repo) do
    url = apply(__MODULE__, repo, [])["html_url"]
    IO.puts "Luaching browser to #{url}..."
    System.cmd("open", [url])
  end
end
