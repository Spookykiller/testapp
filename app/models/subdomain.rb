class Subdomain < ActiveRecord::Base
    after_create :create_tenant
        
    private
    
        def create_tenant
           Apartment::Tenant.create(subdomain_name) 
        end
end
