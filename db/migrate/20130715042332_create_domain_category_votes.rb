class CreateDomainCategoryVotes < ActiveRecord::Migration
  def change
    create_table :domain_category_votes do |t|
      t.references :domain
      t.references :category
      t.string :vote

      t.timestamps
    end
  end
end
