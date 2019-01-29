Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :create, :edit, :show, :update, :destroy]
  match 'index' => "home#index", via: [:get]
  resources :ocorrencia do
    resources :comments, module: :ocorrencia
  end
  resources :termo_compromissos do
    resources :comments, module: :termo_compromissos
  end
  resources :manutencaos do
    resources :comments, module: :manutencaos
  end
  resources :estoque_pecas do
    get 'filed', on: :collection
    match 'arquivar' => "estoque_pecas#arquivar_peca", via: [:get]
    resources :comments, module: :estoque_pecas
  end
  resources :pecas do
    resources :comments, module: :pecas
  end
  resources :modelos do
    resources :comments, module: :modelos
  end
  resources :equipamentos do
  	match 'manutencaos' => "equipamentos#manutencao", via: [:get]
    resources :comments, module: :equipamentos
  end
  resources :servidors do 
    resources :comments, module: :servidors
  end
  resources :comments

  root "home#index"
end
