class AddCoordinatesToSoaps < ActiveRecord::Migration[5.2]
  def change
    add_column :soaps, :latitude, :float
    add_column :soaps, :longitude, :float
  end
end
