Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:index, :new, :create] do
    resources :messeges do
    end
  end
end
