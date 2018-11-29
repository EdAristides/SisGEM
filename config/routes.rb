Rails.application.routes.draw do
  get 'home/index'
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

  get "home/index"

  root "home#index"
end
