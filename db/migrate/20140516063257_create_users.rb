class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end
    add_index :users, :username, :unique => true
  end
end
