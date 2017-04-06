Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [] do
    collection do
      get :user_list_ajax
    end
  end
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create] do
    end
  end
end
