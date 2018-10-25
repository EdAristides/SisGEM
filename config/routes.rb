Rails.application.routes.draw do
  resources :manutencaos
  resources :estoque_pecas
  resources :pecas
  resources :modelos
  resources :equipamentos
  resources :servidors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
