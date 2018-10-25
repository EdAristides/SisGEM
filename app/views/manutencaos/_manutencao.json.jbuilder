json.extract! manutencao, :id, :numOrdem, :descricao, :dataEntrada, :dataSaida, :status, :created_at, :updated_at
json.url manutencao_url(manutencao, format: :json)
