class Accused < ActiveRecord::Base
  belongs_to :case_detail
  belongs_to :relation
  attr_accessible :date_of_birth, :first_name, :known_to_complainant, :sex, :surname, :relation_id
end
