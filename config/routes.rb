Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  devise_scope :user do
    get '/auth/github/callback', to: 'callbacks#github'
  end

  root 'blogs#index'
  get 'about-me', to: 'pages#about'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get 'tags/:tag', to: 'blogs#tags'

  mount ActionCable.server => '/cable'
  mount Commontator::Engine => '/commontator'
end
