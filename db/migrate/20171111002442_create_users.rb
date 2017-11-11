class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :session_id, null: false
      t.timestamps
    end
    add_index :users, :session_id
  end
end
