class DropColumnVoteString < ActiveRecord::Migration
  def up
    remove_column :domain_category_votes, :vote_string
  end

  def down
    add_column :domain_category_votes, :vote_string, :string
  end
end
