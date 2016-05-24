class CreateProjectusers < ActiveRecord::Migration
  def change
    create_table :projectusers do |t|
      t.string :project_id
      t.string :member_id

      t.timestamps null: false
    end
  end
end
