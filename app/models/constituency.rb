class Constituency < ActiveRecord::Base
  has_many :case_details
  belongs_to :region
  attr_accessible :name, :region_id
  
  validates_presence_of :region_id, :name

  def to_s
    "#{name}"
  end

  def self.ransackable_attributes(auth_object = nil)
        super & ['name']
  end
end
