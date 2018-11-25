Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/users/:id",             to: "users#show"
      get "/users",                 to: "users#index"
      get "/users/:id/accounts",    to: "accounts#index"

      get "/groups/:id",            to: "groups#show"
      get "/groups/:id/users",      to: "groups#users"
      get "/users/:user_id/groups", to: "groups#index"

      post "groups", to: "groups#create"
    end
  end
end
