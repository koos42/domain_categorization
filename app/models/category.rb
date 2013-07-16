class SlugValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value ~= /[A-Z\s]/
      record.errors[attribute] << (options[:message] || 'is a bad slug')
    end
  end
end

class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :slug, uniqueness: true, presence: true, slug: true

  has_many :domain_category_votes
  has_many :domains, through: :domain_category_votes

  attr_accessible :name, :slug
end
