Rails.application.routes.draw do
  devise_for :users
  root "hello#index"
  # サインアウトのルートを追加
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'homes/top'
end
