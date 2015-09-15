class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :titulo
      t.text :descricao
      t.boolean :publico
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
