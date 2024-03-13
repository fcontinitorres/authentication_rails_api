Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "static#home"

  # rota teste para ver user cadastrados, foram do contexto do projeto, apenas para teste
  resources :users, only: [:index]

  # rota para login no sistema
  resources :sessions, only: [:create]
  # rota para registrar no sistema
  resources :registrations, only: [:create]

  # Verifica se usuario esta logado
  get :logged_in, to: "sessions#logged_in"
  # Sair da conta
  delete :logout, to: "sessions#logout"
end
