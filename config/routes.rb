Rails.application.routes.draw do
  root 'tests#index'

  resources :tests, only: %i[index destroy show] do
    resources :questions, except: %i[index], shallow: true
  end
end
