class AddUserIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :member_id, :string
  end
end
