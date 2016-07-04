class CreateMileages < ActiveRecord::Migration
  def change
    create_table :mileages do |t|
      t.boolean :mileage_retour
      t.datetime :mileage_date
      t.string :mileage_from
      t.string :mileage_to
      t.decimal :mileage_kilometers
      t.decimal :mileage_total_kilometers
      t.boolean :mileage_billable
      t.decimal :mileage_compensation_rate, :default => 0.19
      t.decimal :mileage_compensation

      t.timestamps null: false
    end
  end
end
