class AddImageThumbToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :image_thumb, :string
  end
end
