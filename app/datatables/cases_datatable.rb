class CasesDatatable
  delegate :url_helpers, to: 'Rails.application.routes'
  delegate :params, :h, :link_to, :button_to,:current_user, to: :@view
  
  def initialize(view)
    @view = view
  end
  
  def as_json(options ={})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: CaseDetail.count,
      iTotalDisplayRecords: case_details.count,
      aaData: data

    }
  end
  private
  def data
    case_details.map do |cased|
      [
        link_to(cased.case_number ,cased,:class=>"btn btn-mini",data:{status:"#{cased.get_status_highlight}"}),
        h(cased.rcci),
        h(cased.date_of_offence),
        h(cased.constituency),
        h(cased.status),
        h(cased.date_trial_commenced),
        h(cased.date_trial_concluded),
        "#{link_to("Edit",url_helpers.edit_case_detail_path(cased),:class=>"btn btn-mini")}
         #{button_to( "Request Escalation", {:method=> :post, controller: 'case_escalations', :case_detail_id=> cased.id,
                                      :user_id=>current_user.id} ,:class=>"btn btn-mini") if (current_user.has_role?(:hc_prosecutor) || current_user.has_role?(:admin)) &&
                                      (cased.status_id == 1) && (cased.case_escalation.nil?)}"
      ]
    end
  end

  def case_details
     @case_details ||= fetch_cases
  end

  def fetch_cases

    case_detail = CaseDetail.order("#{sort_column} #{sort_direction}")
    case_detail = case_detail.page(page).per(per_page)

    if params[:sSearch].present?

        case_detail = case_detail.search_text(params[:sSearch]).get_user_cases(current_user)

        else
      case_detail = case_detail.get_user_cases(current_user)
    end
    case_detail
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[court_case_number rcci date_of_offence constituency_id status_id trial_commenced trial_concluded]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end