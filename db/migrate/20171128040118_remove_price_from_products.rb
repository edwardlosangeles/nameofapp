# 20171124 6.5: Payment Forms with Stripe

class RemovePriceFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price, :decimal
  end
end
