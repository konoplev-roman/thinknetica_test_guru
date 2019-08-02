Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, except: %i[index], shallow: true
  end
end
