class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
