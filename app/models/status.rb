class Status < ActiveRecord::Base
  attr_accessible :name
  has_many :case_details
  
  def to_s
    name
  end

  def self.ransackable_attributes(auth_object = nil)
      super & ['name']
  end


end
