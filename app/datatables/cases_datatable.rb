class CasesDatatable
  delegate :url_helpers, to: 'Rails.application.routes'
  delegate :params, :h, :link_to, :current_user, to: :@view
  
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
        link_to(cased.court_case_number,cased,:class=>"#{cased.get_status_highlight}"),
        h(cased.rcci),
        h(cased.date_of_offence),
        h(cased.constituency),
        h(cased.status),
        h(cased.date_trial_commenced),
        h(cased.date_trial_concluded),
        link_to("Edit",url_helpers.edit_case_detail_path(cased),:class=>"btn btn-mini")
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
      if current_user.has_role? :admin
        case_detail = case_detail.search_text(params[:sSearch])
      else
        case_detail = case_detail.search_text(params[:sSearch]).where(:user_id=> current_user.id)
      end
    elsif current_user.has_role? :admin
      case_detail = case_detail.scoped
    else
      case_detail = case_detai.where(:user_id=> current_user.id)
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
    columns = %w[court_case_number rcci date_of_offence constituency status trial_commenced trial_concluded]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end