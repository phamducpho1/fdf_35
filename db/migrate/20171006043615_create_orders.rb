class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status
      t.string :phone
      t.string :address
      t.float :total_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
