class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :favorite_coffee_shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
