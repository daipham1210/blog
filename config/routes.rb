Rails.application.routes.draw do
  resources :comments

  devise_for :users, skip: [:registrations], path: '', 
                     controllers: { omniauth_callbacks: 'auth/callbacks' },
                     path_names: { sign_in: 'login', sign_out: 'logout' }

  root 'blogs#index'
  get 'about-me', to: 'pages#about'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get 'tags/:tag', to: 'blogs#tags'

  mount ActionCable.server => '/cable'
end
