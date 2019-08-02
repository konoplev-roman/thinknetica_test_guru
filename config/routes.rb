Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, except: %i[index], shallow: true do
      resources :answers, except: %i[index show], shallow: true
    end
  end
end
