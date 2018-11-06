class CreateTermoCompromissos < ActiveRecord::Migration[5.2]
  def change
    create_table :termo_compromissos do |t|
      t.string :numTermo
      t.date :dataVinculo
      t.date :dataDevolucao
      t.belongs_to :equipamento
      t.belongs_to :servidor

      t.timestamps
    end
  end
end
