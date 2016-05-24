class ChangeColumnStatusInProject < ActiveRecord::Migration
  def change
  	change_column :projects, :status, :int, default: 0
  end
end
