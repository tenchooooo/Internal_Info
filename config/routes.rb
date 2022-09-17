Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end
  get 'homes/top'
# 顧客用
# URL /members/sign_in ...
devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

root to: "homes#top"
get 'top' => 'public/homes#top'
devise_scope :member do
  post 'public/guest_sign_in', to: 'public/sessions#new_guest'
end
devise_scope :admin do
  post 'admin/guest_sign_in', to: 'admin/sessions#new_guest'
end


scope module: :public do
  resources :schedules
  # タグによって絞り込んだ投稿を表示するアクションへのルーティング
  resources :tags do
    get 'posts', to: 'posts#search'
  end
  resources :members, only: [:show, :edit, :update] do
    get 'posts', to: 'members#posts'
    get 'schedules', to: 'members#schedules'
  end

  resources :posts do
    collection {get "search", to: 'posts#post_search'}
    resource :checks, only: [:create, :destroy]
    resources :checks, only: [:index]
    resources :comments, only: [:create, :destroy]#commentsコントローラへのルーティング
  end
  resources :notifications, only: :index
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update, :destroy] do
      get 'posts', to: 'members#posts'
      get 'schedules', to: 'members#schedules'
    end
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      collection {get "search", to: 'posts#post_search'}
      resources :comments, only: [:destroy]#commentsコントローラへのルーティング
    end
    resources :schedules, only: [:index, :show, :edit, :update, :destroy]
    resources :tags do
      get 'posts', to: 'posts#search'
    end
  end
end

