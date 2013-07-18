class MakeVoteABoolean < ActiveRecord::Migration
  def up
    remove_column :domain_category_votes, :vote
    add_column :domain_category_votes, :vote, :boolean, null: false
  end

  def down
    remove_column :domain_category_votes, :vote
    add_column :domain_category_votes, :string, :boolean, null: false
  end
end
