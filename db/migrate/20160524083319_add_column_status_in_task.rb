class AddColumnStatusInTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :status, :string, default: 0
  end
end
