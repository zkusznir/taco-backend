Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/users/:id",             to: "users#show"
      get "/users",                 to: "users#index"
      get "/users/:id/accounts",    to: "accounts#index"

      get "/groups/:id", to: "groups#show"

      post "groups", to: "groups#create"
    end
  end
end
