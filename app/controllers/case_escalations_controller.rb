class CaseEscalationsController < ApplicationController

  def index
    @case_escalations = CaseEscalation.where(approved: [nil,false])
  end

  def show
    @case_escalation = CaseEscalation.find(params[:id])
  end

  def create
    @case_escalation = CaseEscalation.new(params.except(:action,:controller,:method, :authenticity_token))

    if @case_escalation.save
      flash[:notice] = "Escalation was successfully created, the DPP will be notified"
      respond_to do |format|
        format.html {redirect_to case_details_path}
      end
    else
      respond_to do |format|
        format.html{ redirect_to case_details_path}
      end
    end
  end

  def approve

      if params[:escalation_id].present?
        if params[:approve].present?
          params[:escalation_id].each do |cased|
            escalate_case(cased)
          end
        elsif params[:deny].present?
          params[:escalation_id].each do |cased|
            CaseEscalation.find(cased).delete
          end
        end
      end
      redirect_to case_escalations_path
  end
  def destroy
    @case_escalation = CaseEscalation.find(params[:id])
    @case_escalation.delete

    redirect_to case_escalations_path
  end

  private
  
  def escalate_case(id)
    @case_escalation = CaseEscalation.find(id)
    exceptions = [:court_case_number,:user_id,:status_id,:judgement,:sentence,:reason_for_acquittal,
                  :judge_remarks,:action_taken]
    associations = [:accuseds,:complainants,:case_charges,:attachments]
    
    old_case = CaseDetail.find(@case_escalation.case_detail_id)
    new_case = CaseDetail.new

    CaseDetail.copy_attributes_between_cases(old_case,new_case,except_list:exceptions)
    new_case.user_id = @case_escalation.user_id
    new_case.status_id = Status.find_by_name("Committed to HC").id
    old_case.status_id = new_case.status_id
    new_case.save
    old_case.save
    CaseDetail.copy_associations(old_case,new_case,associations:associations)

    old_case.case_linkages.new(:linked_case_id => new_case.id,:case_detail_id=>old_case.id ).save
    new_case.inverse_linkages.new(:linked_case_id => old_case.id, :case_detail_id=>new_case.id).save

    @case_escalation.approved = true
    @case_escalation.approved_on = Date.today
    @case_escalation.save
  end
end
