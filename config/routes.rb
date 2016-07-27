Rails.application.routes.draw do
  root to: 'messages#index'

  # ActionCable will run in the same process when we run rails server
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
