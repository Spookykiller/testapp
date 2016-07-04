class Timesheet < ActiveRecord::Base
    belongs_to :client
    has_and_belongs_to_many :projects
    
    validates :timesheet_project_number, presence: true
    validates :timesheet_name, presence: true
    validates :timesheet_description, presence: true
    validates :timesheet_date, presence: true
    validates :timesheet_hours, presence: true
    validates :timesheet_comment, presence: true
end
