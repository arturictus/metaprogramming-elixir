# https://github.com/cheeyeo/Mime/blob/master/mime.exs
defmodule Mime do
  defmacro __using__(mimes) do
    quote do
      Module.register_attribute __MODULE__, :mimes, accumulate: true,
                                                    persist: false
      import unquote(__MODULE__), only: [exts_for_type: 1, mimes: 0]
      @mimes unquote(Macro.escape(mimes))
    end
  end

  defmacro mimes, do: quote do unquote(@mimes) end

  # defmacro exts_for_type(key) do
  #   quote bind_quoted: [key: key] do
  #     Module.get_attribute(__MODULE__, :mimes)
  #     |> Keyword.fetch(key)
  #   end
  # end
end
