Rails.application.routes.draw do
  devise_for :users

  root to: "chat_rooms#index"

  resources :chat_rooms
  resources :messages
end
