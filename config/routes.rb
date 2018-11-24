Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/users/:id",  to: "users#show"
      get "/users",      to: "users#index"
      get "/groups/:id", to: "groups#show"
    end
  end
end
