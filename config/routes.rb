Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, only: %i[index show], shallow: true
  end
end
