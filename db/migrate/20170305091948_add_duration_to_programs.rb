class AddDurationToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :duration, :decimal, precision: 4, scale: 2
  end
end
