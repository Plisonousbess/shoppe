class CreatePendingPurchases < ActiveRecord::Migration
  def change
    create_table :pending_purchases do |t|
      t.references :cart
      t.references :product

      t.timestamps null: false
    end
  end
end
