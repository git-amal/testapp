class AddColumnsInInvoices < ActiveRecord::Migration
  def change
  	add_column :invoices, :start_date, :datetime
  	add_column :invoices, :end_date, :datetime
  	add_column :invoices, :working_hours, :int, default: 0
  end
end
