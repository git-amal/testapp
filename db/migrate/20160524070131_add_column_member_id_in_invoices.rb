class AddColumnMemberIdInInvoices < ActiveRecord::Migration
  def change
  	add_column :invoices, :member_id, :string
  end
end
