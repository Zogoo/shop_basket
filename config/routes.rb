Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :users do
    get 'basket/show'
    get 'basket/create'
    get 'basket/add'
    get 'basket/delete'
    get 'basket/clean'
  end

  namespace :users do
    get 'my_page/index'
    get 'my_page/checked'
  end

  # Home controller
  get 'home/index'
  post 'home/search'
  get 'home/category'
  get 'home/suggestion'
end
