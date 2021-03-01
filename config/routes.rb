Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :api do
    namespace :v1 do
      get 'basket/show'
      get 'basket/create'
      get 'basket/add'
      get 'basket/delete'
      get 'basket/clean'
      get 'my_page/index'
      get 'my_page/checked'
      get 'products/all'
      post 'products/search'
    end
  end

  get '*path', to: 'home#index'
end
