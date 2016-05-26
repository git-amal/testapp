class ChangeRoleTypeInUsers < ActiveRecord::Migration
  def change
  	change_column :members, :role, 'integer USING CAST(role AS integer)', default: 0
  end
end
