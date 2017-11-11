class CreateMnistImages < ActiveRecord::Migration[5.1]
  def change
    create_table :mnist_images do |t|
      t.string :label, null: false
      t.text :base64_string, null: false

      t.timestamps
    end
    add_index :mnist_images, :base64_string, unique: true
  end
end
