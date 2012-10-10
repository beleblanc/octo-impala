class CaseCharge < ActiveRecord::Base
  belongs_to :case_detail
  belongs_to :charge

  attr_accessible :case_detail_id, :charge_id
end
