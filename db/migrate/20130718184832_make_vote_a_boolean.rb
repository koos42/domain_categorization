class MakeVoteABoolean < ActiveRecord::Migration
  def up
    rename_column :domain_category_votes, :vote, :vote_string
    add_column :domain_category_votes, :vote, :boolean, null: false, default: false
  end

  def down
    remove_column :domain_category_votes, :vote
    add_column :domain_category_votes, :vote, :string
  end
end
