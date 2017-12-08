class AddTotalInCentsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total_in_cents, :integer
  end
end
