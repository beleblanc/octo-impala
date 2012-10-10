class Charge < ActiveRecord::Base
  has_many :case_charges
  has_many :case_details, through: :case_charges
  attr_accessible :name
  
  def to_s
    name    
  end

  def self.ransackable_attributes(auth_object = nil)
          super & %w"name"
      end
end
