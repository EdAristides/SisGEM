Rails.application.routes.draw do
  resources :ocorrencia
  resources :termo_compromissos
  resources :manutencaos
  resources :estoque_pecas
  resources :pecas
  resources :modelos
  resources :equipamentos do
  	match 'manutencaos' => "equipamentos#manutencao", via: [:get]
  end
  resources :servidors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'manutencao_equipamento' => "equipamentos#manutencao"
end
