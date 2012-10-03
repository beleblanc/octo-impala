class HomeController < ApplicationController
  def index

    if user_signed_in?
      @cases = CaseDetail.all
      @charges = Charge.includes(:case_details).where('case_details.date_reported'=>3.months.ago..Date.today)

      @graph = Report.case_type_report(@cases, current_user)

      @status = Report.status_type_report(@cases,current_user)
    end

  end

  def about
  end
end
