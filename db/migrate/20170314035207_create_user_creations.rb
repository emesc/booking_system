class CreateUserCreations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_creations do |t|
      t.integer :user_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
