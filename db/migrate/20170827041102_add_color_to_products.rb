class AddColorToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :colour, :string
  end
end
