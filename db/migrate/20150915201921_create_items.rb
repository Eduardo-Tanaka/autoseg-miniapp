class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description,  null: false
      t.references :list, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
