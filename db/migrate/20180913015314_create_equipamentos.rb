class CreateEquipamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :equipamentos do |t|
      t.string :patrimonio
      t.string :serial
      t.date :dataAquisicao
      t.string :status
      t.belongs_to :modelo

      t.timestamps
    end
  end
end
