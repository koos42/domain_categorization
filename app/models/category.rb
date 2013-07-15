class Category < ActiveRecord::Base
  validates uniqueness: true
  attr_accessible :name, :string
end
