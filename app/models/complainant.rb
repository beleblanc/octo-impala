class Complainant < ActiveRecord::Base
  belongs_to :case_detail
  attr_accessible :date_of_birth, :first_name, :sex, :surname, :case_id
end
