class ProductOwner < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks
end
