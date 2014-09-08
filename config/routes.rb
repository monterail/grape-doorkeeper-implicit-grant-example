Application.routes.draw do
  devise_for :users

  mount API::Base => '/api'
  root to: 'index#index'
end

