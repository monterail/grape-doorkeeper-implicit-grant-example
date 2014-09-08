Application.routes.draw do

  mount API::Base => '/api'
  root to: 'index#index'
end

