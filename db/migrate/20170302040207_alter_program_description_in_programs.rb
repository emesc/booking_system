class AlterProgramDescriptionInPrograms < ActiveRecord::Migration[5.0]
  def up
    change_table :programs do |t|
      t.change :program_description, :text
    end
  end

  def down
    change_table :programs do |t|
      t.change :program_description, :string
    end
  end
end
