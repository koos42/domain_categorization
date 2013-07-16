class Domain < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :domain_category_votes
  has_many :categories, through: :domain_category_votes

  attr_accessible :name
end
