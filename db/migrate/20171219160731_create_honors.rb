class CreateHonors < ActiveRecord::Migration[5.1]
  def change
    create_table :honors do |t|
      t.integer :honorer_id, references: :users
      t.integer :honored_id, references: :users

      t.timestamps
    end
  end
end
