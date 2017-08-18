class User < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :tasks
end
