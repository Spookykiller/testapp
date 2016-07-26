class Subdomain < ActiveRecord::Base
    after_create :create_tenant
    
    validates :subdomain_name, presence: true, uniqueness: true
    
    private
    
        def create_tenant
           Apartment::Tenant.create(subdomain_name) 
        end
end
