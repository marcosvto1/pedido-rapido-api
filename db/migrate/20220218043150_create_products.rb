class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.references :category
      t.decimal :price, precision: 10, scale: 2
      t.integer :time_to_prepare
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
