class Charge < ActiveRecord::Base
  has_and_belongs_to_many :case_details
  attr_accessible :name
  
  def to_s
    name    
  end
end
