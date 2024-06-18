Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root "hello#index"
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'homes/top'
end
