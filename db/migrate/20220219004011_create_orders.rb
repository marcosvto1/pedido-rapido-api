class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :table
      t.integer :status, default: 1
      t.string :detail
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
