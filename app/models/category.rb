class Category < ActiveRecord::Base
  validates uniqueness: true

  has_many :domain_category_votes
  has_many :domains, through: :domain_category_votes

  attr_accessible :name
end
