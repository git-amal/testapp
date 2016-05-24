class ChangeRoleTypeInUsers < ActiveRecord::Migration
  def change
  	change_column :members, :role, :int, default: 0
  end
end
