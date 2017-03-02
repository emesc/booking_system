class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :program_title
      t.string :program_description
      t.decimal :program_fee, precision: 5, scale: 2
      t.string :image_title
      t.string :topics
      t.integer :group_size_min
      t.integer :group_size_max
      t.time :time_am
      t.time :time_pm
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :delivery_mode, foreign_key: true
      t.references :school_level, foreign_key: true

      t.timestamps
    end
  end
end
