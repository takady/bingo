Rails.application.routes.draw do
  resources :games, only: [:index, :show] do
    collection do
      get :start
    end
  end
end
