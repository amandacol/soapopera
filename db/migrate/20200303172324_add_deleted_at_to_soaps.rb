class AddDeletedAtToSoaps < ActiveRecord::Migration[5.2]
  def change
    add_column :soaps, :deleted_at, :datetime
    add_index :soaps, :deleted_at
  end
end
