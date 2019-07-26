Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, only: [], shallow: true
  end
end
