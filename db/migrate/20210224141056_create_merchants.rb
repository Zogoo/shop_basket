class CreateMerchants < ActiveRecord::Migration[6.1]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :address
      t.string :mobile
      t.boolean :mobile_confirmed
      t.string :phone
      t.string :phone_confirmed

      t.references :user, null: true, foreign_key: true

      t.timestamps
    end

    add_index :merchants, :name, unique: true
  end
end
