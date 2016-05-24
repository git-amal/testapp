class AddColumnStatusInProject < ActiveRecord::Migration
  def change
  	add_column :projects, :status, :string, default: 0
  end
end
