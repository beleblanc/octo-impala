class Complainant < ActiveRecord::Base
  belongs_to :case_detail
  attr_accessible :age, :first_name, :sex, :surname, :case_id

  def self.ransackable_attributes(auth_object = nil)
          super & %w"first_name surname sex date_of_birth"
  end
end
