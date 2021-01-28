class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :stock, null: false, default: 0
      t.integer :delivery_period
      t.integer :delivery_type, null: false, default: 0
      t.integer :dimensions
      t.integer :weight
      t.string :description

      t.timestamps
    end
  end
end
