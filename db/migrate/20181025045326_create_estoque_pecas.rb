class CreateEstoquePecas < ActiveRecord::Migration[5.2]
  def change
    create_table :estoque_pecas do |t|
      t.string :status
      t.integer :quantidade
      t.belongs_to :equipamento
      t.belongs_to :peca

      t.timestamps
    end
  end
end
