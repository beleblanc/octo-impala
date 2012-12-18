class Appeal < ActiveRecord::Base
  attr_accessible :accused_id, :case_detail_id, :case_number, :commenced_on, :concluded_on, :conviction_appeal_allowed,
                  :conviction_appeal_disallowed, :conviction_disallowed_reason, :court_type, :judge_remarks,
                  :new_sentence, :prosecutor, :grounds_for, :received_on, :representative, :sentence_appeal_allowed,
                  :sentence_appeal_disallowed, :sentence_disallowed_reason

  belongs_to :case_detail
  belongs_to :accused

end
