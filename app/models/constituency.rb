class Constituency < ActiveRecord::Base
  has_many :case_details
  belongs_to :region
  attr_accessible :name, :region_id

  def to_s
    "#{name}"
  end
end
