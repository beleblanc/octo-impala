class Relation < ActiveRecord::Base
  has_many :accuseds
  attr_accessible :name
  
  def to_s
    name
  end
end
