class Project < ActiveRecord::Base
    belongs_to :company
    belongs_to :client
    has_many :timesheets
    
    validates :project_name, presence: true
    validates :project_client, presence: true
    validates :project_budget, presence: true

end
