class AddColumnApproveInMembers < ActiveRecord::Migration
  def change
  	add_column :members, :approve, :boolean, default: false
  end
end
