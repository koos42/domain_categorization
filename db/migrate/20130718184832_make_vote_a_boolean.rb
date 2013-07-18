class MakeVoteABoolean < ActiveRecord::Migration
  def up
    change_column :domain_category_votes, :vote, :boolean, null: false
  end

  def down
    change_column :domain_category_votes, :vote, :string, null: false
  end
end
