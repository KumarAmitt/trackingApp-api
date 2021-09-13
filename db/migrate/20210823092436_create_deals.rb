class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :premium
      t.string :application_id

      t.timestamps
    end
  end
end
