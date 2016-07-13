class CreateSubdomains < ActiveRecord::Migration
  def change
    create_table :subdomains do |t|
      t.string :subdomain_name

      t.timestamps null: false
    end
  end
end
