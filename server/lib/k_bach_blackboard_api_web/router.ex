defmodule KBachBlackboardApiWeb.Router do
  use KBachBlackboardApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug.GraphiQL, schema: KBachBlackboardApiWeb.Schema
  end
end
