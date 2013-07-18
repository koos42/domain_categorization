class DomainCategoryVote < ActiveRecord::Base
  belongs_to :domain
  belongs_to :category

  attr_accessible :category, :domain, :vote
end
