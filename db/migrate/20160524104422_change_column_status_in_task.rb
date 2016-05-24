class ChangeColumnStatusInTask < ActiveRecord::Migration
  def change
  	  	change_column :tasks, :status, :int, default: 0
  end
end
