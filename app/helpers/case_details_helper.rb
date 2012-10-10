module CaseDetailsHelper
  
  
  def escalate_button(cased)
    button_to( "Resquest Escalation", {:method=> :post, controller: 'case_escalations', :case_detail_id=> cased.id,
                                  :user_id=>current_user.id} ,:class=>"btn btn-mini") if 
                                  (current_user.has_role?(:hc_prosecutor) || current_user.has_role?(:admin)) &&
                                  (cased.status_id == 1) && (cased.case_escalation.nil?)
  end
end
