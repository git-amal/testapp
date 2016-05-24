class AddUsernameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :username, :string
    add_column :members, :role, :string
  end
end
