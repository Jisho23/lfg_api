class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :group_id
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :accept, :default => false

      t.timestamps
    end
  end
end
