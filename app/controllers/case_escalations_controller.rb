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
      CaseEscalation.where(:id=>params[:escalation_id]).update_all(:approved_on=>Date.today, :approved=>true)
      
      params[:escalation_id].each do |cased|
        escalate_case(cased)
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
    old_case = CaseDetail.find(@case_escalation.case_detail_id)
    new_case = old_case.dup
    new_case.court_type_id = CourtType.find_by_name("High Court").id
    new_case.court_case_number = ' '
    new_case.user_id = @case_escalation.user_id
    new_case.save
    old_case.complainants.each do |complainant|
      new_complainant = new_case.complainants.new
      new_complainant = complainant.dup
      new_complainant.save
    end
    
    old_case.accuseds.each do |accused|
      new_accused = new_case.accuseds.new
      new_accused = accused.dup
      new_accused.save
    end

    old_case.charges.each do |charge|
      new_charge = new_case.charges.new(id: charge.id)
      new_charge.save
    end
    
    
    old_case.case_linkages.create(:linked_case_id => new_case.id )
    new_case.inverse_linkages.create(:linked_case_id => old_case.id)
    old_case.status_id = Status.find_by_name("Committed to HC").id
    old_status.save
    
  end
end
