class CaseLinkage < ActiveRecord::Base
  attr_accessible :case_detail_id, :linked_case_id

  belongs_to :case_detail
  belongs_to :linked_case, :class_name => "CaseDetail"
end
