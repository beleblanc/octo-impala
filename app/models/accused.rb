class Accused < ActiveRecord::Base
  belongs_to :case_detail
  belongs_to :relation
  has_one :appeal
  attr_accessible :age, :first_name, :known_to_complainant, :sex, :surname, :relation_id


  def self.ransackable_attributes(auth_object = nil)
        super & %w"first_name surname sex date_of_birth"
  end

  def to_s
    "#{surname}, #{first_name}"
  end
end
