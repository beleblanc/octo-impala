class CaseEscalation < ActiveRecord::Base
  belongs_to :case_detail
  belongs_to :user
  attr_accessible :approved, :approved_on, :user_id, :case_detail_id
end
