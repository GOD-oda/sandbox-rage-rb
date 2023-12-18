Rage.routes.draw do
  root to: ->(env) { [200, {}, "It works!"] }

  get "page", to: "pages#index"
  get "page/:id", to: "pages#show"
end
