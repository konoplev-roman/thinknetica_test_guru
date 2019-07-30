Rails.application.routes.draw do
  resources :tests, only: %i[index destroy] do
    resources :questions, except: %i[edit update], shallow: true
  end
end
