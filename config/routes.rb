Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

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
  get 'topic/:topic', to: 'blogs#topics'

  mount ActionCable.server => '/cable'
  mount Commontator::Engine => '/commontator'
end
