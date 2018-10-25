class CreatePecas < ActiveRecord::Migration[5.2]
  def change
    create_table :pecas do |t|
      t.string :nome
      t.string :caracteristica

      t.timestamps
    end
  end
end
