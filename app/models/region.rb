class Region < ActiveRecord::Base
  has_many :case_details
  has_many :constituencies
  attr_accessible :name

  def to_s
    "#{name}"
  end

  def self.ransackable_attributes(auth_object = nil)
        super & ['name']
    end

end
