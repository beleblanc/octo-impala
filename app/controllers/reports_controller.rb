class ReportsController < ApplicationController
  def index
    @search = CaseDetail.search(params[:q])
    @case_details = @search.result
    @search.build_condition

    respond_to do |format|
      format.html
      format.csv {send_data CaseDetail.to_csv(@case_details,col_sep:",")}
      format.xls {send_data CaseDetail.to_csv(@case_details,col_sep: "\t")}
    end
  end
end
