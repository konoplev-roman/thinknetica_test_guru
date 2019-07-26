Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, only: %i[index], shallow: true
  end
end
