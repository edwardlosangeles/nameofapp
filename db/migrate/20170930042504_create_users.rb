# 20170929 ED 5.4 authentication
# $ rails generate scaffold user first_name last_name


class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
