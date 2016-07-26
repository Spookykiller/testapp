class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :article_code
      t.string :article_description
      t.string :article_unit
      t.decimal :article_VAT_percentage
      t.decimal :article_unit_price

      t.timestamps null: false
    end
  end
end
