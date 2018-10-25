class CreateModelos < ActiveRecord::Migration[5.2]
  def change
    create_table :modelos do |t|
      t.string :marca
      t.string :configuracao
      t.float :valor
      t.string :tipo

      t.timestamps
    end
  end
end
