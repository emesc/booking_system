class CreateSuitabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :suitabilities do |t|
      t.integer :program_id
      t.integer :school_level_id

      t.timestamps
    end

    add_index :suitabilities, [:program_id, :school_level_id]
  end
end
