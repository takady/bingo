Rails.application.routes.draw do
  resources :games, only: [:index, :show, :destroy] do
    collection do
      get :start
    end
  end
end
