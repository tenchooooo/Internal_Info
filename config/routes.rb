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

scope module: :public do
  resources :posts
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
