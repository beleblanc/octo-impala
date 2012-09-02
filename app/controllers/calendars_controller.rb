class CalendarsController < ApplicationController
  
  def index
    @case_details = CaseDetail.all
    @cases_by_date = @case_details.group_by(&:date_trial_commenced)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
  end
  
end
