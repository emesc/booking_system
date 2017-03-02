class CreateSchoolLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :school_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
