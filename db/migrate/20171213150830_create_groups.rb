class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :game_id
      t.integer :owner_id, references: :users

      t.timestamps
    end
  end
end
