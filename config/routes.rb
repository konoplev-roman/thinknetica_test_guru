Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, except: %i[edit update], shallow: true
  end
end
