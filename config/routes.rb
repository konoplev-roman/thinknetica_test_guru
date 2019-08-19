Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, except: %i[index], shallow: true do
      resources :answers, except: %i[index show], shallow: true
    end

    post 'start', on: :member
  end

  resources :passed_tests, only: %i[show update] do
    get 'result', on: :member
  end
end
