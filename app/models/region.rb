class Region < ActiveRecord::Base
  has_many :case_details
  has_many :constituencies
  attr_accessible :name

  def to_s
    "#{name}"
  end

end
