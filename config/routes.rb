Rails.application.routes.draw do
  devise_for :users
  get 'applications/index'

  root to: 'applications#index'

  resources :applications do
    resources :tests
    resources :answers
  end
end
