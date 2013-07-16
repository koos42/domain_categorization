class DomainCategoryVote < ActiveRecord::Base
  validates :vote, presence: true

  belongs_to :domain
  belongs_to :category

  attr_accessible :category, :domain, :vote
end
