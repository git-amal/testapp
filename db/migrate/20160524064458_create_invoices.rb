class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :project_id 
      t.string :name 
      t.string :description 
      t.float :cost 
      t.string :created_by
      t.timestamps null: false
    end
  end
end
