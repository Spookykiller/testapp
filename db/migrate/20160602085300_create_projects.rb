class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_number
      t.string :project_name
      t.string :project_client
      t.decimal :project_budget
      t.decimal :project_hour_rate
      t.decimal :project_billable
      t.decimal :project_non_billable
      t.decimal :project_residual

      t.timestamps null: false
    end
  end
end
