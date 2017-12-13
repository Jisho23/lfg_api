class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :message

      t.timestamps
    end
  end
end
