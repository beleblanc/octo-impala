class Relation < ActiveRecord::Base
  has_many :accuseds
  attr_accessible :name
end
