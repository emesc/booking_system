class AddImageToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :image, :string
  end
end
