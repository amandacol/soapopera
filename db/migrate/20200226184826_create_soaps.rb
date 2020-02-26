class CreateSoaps < ActiveRecord::Migration[5.2]
  def change
    create_table :soaps do |t|
      t.string :name
      t.string :scent
      t.text :properties
      t.integer :price
      t.string :weight
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
