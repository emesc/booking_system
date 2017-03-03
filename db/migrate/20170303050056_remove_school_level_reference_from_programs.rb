class RemoveSchoolLevelReferenceFromPrograms < ActiveRecord::Migration[5.0]
  def change
    change_table :programs do |t|
      t.remove_references :school_level, index: true, foreign_key: true
    end
  end
end
