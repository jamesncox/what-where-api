class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.integer :store_id

      t.timestamps
    end
  end
end
