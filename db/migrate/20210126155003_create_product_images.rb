class CreateProductImages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.references :product, foreign_key: { on_delete: :cascade }
      t.string :image

      t.timestamps
    end
  end
end
