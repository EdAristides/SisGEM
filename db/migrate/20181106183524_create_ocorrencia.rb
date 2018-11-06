class CreateOcorrencia < ActiveRecord::Migration[5.2]
  def change
    create_table :ocorrencia do |t|
      t.string :tipo
      t.date :dataOcorrencia
      t.belongs_to :termo_compromisso

      t.timestamps
    end
  end
end
