Rails.application.routes.draw do
  get 'welcome/index'
  get 'inicio', to: 'welcome#index'
  get 'teste', to: 'welcome#index'
  root to: 'welcome#index'
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
