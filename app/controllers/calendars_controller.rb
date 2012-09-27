class CalendarsController < ApplicationController
  
  def index
    if current_user.has_role?(:admin) || current_user.has_role?(:super_admin)
      @case_details = CaseDetail.includes(:status).all
    else
      @case_details = CaseDetail.includes(:status).where(:user_id => current_user.id)
    end
    @cases_by_date = @case_details.group_by(&:date_reported)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
  end
  
end
