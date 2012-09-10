class Charge < ActiveRecord::Base
  has_and_belongs_to_many :case_details
  attr_accessible :name
  
  def to_s
    name    
  end

  def self.ransackable_attributes(auth_object = nil)
          super & %w"name"
      end
end
