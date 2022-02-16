class CreateAdminConfigurations < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_configurations do |t|
      t.string :name
      t.integer :table_quantity
      t.time :start_at
      t.time :finish_at

      t.timestamps
    end
  end
end
