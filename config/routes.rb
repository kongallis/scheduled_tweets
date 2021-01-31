Rails.application.routes.draw do
  
  get "about", to: "about#index"

   root to: "main#index"

  get "first", to: "first#index"
end
