class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :timesheet_project_number
      t.string :timesheet_name
      t.string :timesheet_description
      t.datetime :timesheet_date
      t.decimal :timesheet_hours
      t.boolean :timesheet_billable
      t.string :timesheet_comment

      t.timestamps null: false
    end
  end
end
