class Domain < ActiveRecord::Base
  # attr_accessible :title, :body
  validates uniqueness: true
  attr_accessible :name
end
