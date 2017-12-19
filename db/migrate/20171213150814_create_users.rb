class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :image
      t.string :password_digest
      t.boolean :lfg, :default => true
      t.string :status, :default => 'Hello world!'

      t.timestamps
    end
  end
end
