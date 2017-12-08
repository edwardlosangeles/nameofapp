class RemoveTotalFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :total, :float
  end
end
