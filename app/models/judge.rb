class Judge < ActiveRecord::Base
  has_many :case_details
  attr_accessible :first_name, :sex, :surname

  validates :first_name, :presence => true
  validates :surname, :presence => true

  def to_s
    "Magistrate #{first_name} #{surname}"
  end

  def self.ransackable_attributes(auth_object = nil)
          super & %w"first_name surname sex "
      end
end
