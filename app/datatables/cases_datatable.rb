class CasesDatatable
  delegate :params, :h, :link_to, to: :@view
  
  def initialize(view)
    @view = view
  end
  
  def as_json(options ={})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: CaseDetail.count,
      iTotalDisplayRecords: case_details.length,
      aaData: data
    }
  end
  private
  def data
    case_details.map do |cased|
      [
        link_to(cased.court_case_number,cased.court_case_number.to_s),
        h(cased.rcci),
        h(cased.date_of_offence),
        h(cased.constituency_id),
        h(cased.status),
        h(cased.date_trial_commenced),
        h(cased.date_trial_concluded)
      ]
    end
  end

  def case_details
     @case_details ||= fetch_cases
  end

  def fetch_cases

    case_detail = CaseDetail.order("#{sort_column} #{sort_direction}")
    case_detail = case_detail.page(page).per_page(per_page)

    if params[:sSearch].present?
      case_detail = case_detail.where("court_case_number like :search or rcci like :search  ", search: "%#{:sSearch}%")
    end
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[court_case_number rcci date_of_offence constituency status trial_commenced trial_concluded]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end