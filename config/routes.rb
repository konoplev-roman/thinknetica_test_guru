Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'sessions' }

  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :passed_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: %i[index], shallow: true do
        patch :update_inline, on: :member

        resources :answers, except: %i[index show], shallow: true do
          patch :update_inline, on: :member
        end
      end
    end

    resources :gists, only: :index

    resources :badges, except: :show do
      patch :update_inline, on: :member
    end
  end
end
