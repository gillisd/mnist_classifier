class CreateMnistImagesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :mnist_images_users do |t|
      t.integer :mnist_image_id, null: false
      t.integer :user_id, null: false
      t.string :user_label, null: false

      t.timestamps
    end

    add_index :mnist_images_users, [:user_id, :mnist_image_id], unique: true
  end
end
