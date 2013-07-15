class Domain < ActiveRecord::Base
  validates uniqueness: true
  attr_accessible :name
end
