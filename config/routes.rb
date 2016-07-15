Rails.application.routes.draw do
  root to: 'games#index'

  resources :games, only: [:index, :show] do
    collection do
      get :start
    end
  end
end
