class Prosecutor < ActiveRecord::Base
  has_many :case_details

  attr_accessible :first_name, :surname ,:sex,:region_id

  validates :first_name, :presence => true
  validates :surname, :presence => true

  def to_s
    "#{surname}, #{first_name}"
  end

end
