Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :home
  # get 'home/index'
  resources :ocorrencia
  resources :termo_compromissos
  resources :manutencaos
  resources :estoque_pecas do
    get 'filed', on: :collection
  end
  resources :pecas
  resources :modelos
  resources :equipamentos do
  	match 'manutencaos' => "equipamentos#manutencao", via: [:get]
  end
  resources :servidors

  root "home#index"
end
