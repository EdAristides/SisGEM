class CreateManutencaos < ActiveRecord::Migration[5.2]
  def change
    create_table :manutencaos do |t|
      t.string :numOrdem
      t.string :descricao
      t.date :dataEntrada
      t.date :dataSaida
      t.string :status
      t.belongs_to :equipamento

      t.timestamps
    end
  end
end
