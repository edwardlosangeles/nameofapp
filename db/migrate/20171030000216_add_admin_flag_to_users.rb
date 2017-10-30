# 20171029 5.10 Admin Role & Moderating User Comments
# $ rails g migration add_admin_flag_to_users admin:boolean

class AddAdminFlagToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
