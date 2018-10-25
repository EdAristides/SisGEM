class CreateServidors < ActiveRecord::Migration[5.2]
  def change
    create_table :servidors do |t|
      t.string :siape
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :cargo

      t.timestamps
    end
  end
end
