
class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :member_id
      t.string :project_id

      t.timestamps null: false
    end
  end
end