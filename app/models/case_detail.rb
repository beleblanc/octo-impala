class CaseDetail < ActiveRecord::Base

  include PgSearch
  pg_search_scope :search_text, against:[:rcci,:court_case_number,:date_of_offence,:date_reported],
                  using:{tsearch:{dictionary:"english", :prefix=>true}},
                  associated_against:{region: :name, status: :name, charges: :name, constituency: :name, user: [:first_name,:surname]}

  attr_accessible :accuseds_attributes, :complainants_attributes,:prosecutor_id, :judge_id, :rcci,
                  :court_case_number, :court_type_id, :date_of_offence, :region_id, :constituency_id,
                  :date_reported, :date_submitted, :action_taken, :status_id, :comment, :date_trial_commenced,
                  :date_trial_concluded, :judgment, :sentence, :complainant, :accused, :reason_for_acquittal,
                  :judge_remarks,:charge_ids ,:user_id, :attachments_attributes

  has_many :accuseds    , :dependent => :destroy
  has_many :complainants, :dependent => :destroy
  has_many :attachments, :as => :attacheable
  has_many :appeals
  belongs_to :constituency
  belongs_to :region
  belongs_to :judge

  belongs_to :action
  belongs_to :status
  belongs_to :user
  belongs_to :court_type
  has_and_belongs_to_many :charges

  has_many :case_linkages
  has_many :linked_cases, :through => :case_linkages
  has_many :inverse_linkages, :class_name => "CaseLinkage", :foreign_key => :linked_case_id
  has_many :inverse_linked_cases, :through => :inverse_linkages, :source => :case_detail
  has_one  :case_escalation



 # named_scope :admin_check, where(user_id: current_user.id) unless current_user.has_role? :admin
  
  validates :court_case_number, uniqueness: true
  validates_presence_of :judge_id,:user_id


  accepts_nested_attributes_for :accuseds , :allow_destroy => true,:reject_if => :all_blank
  accepts_nested_attributes_for :complainants, :allow_destroy => true,:reject_if => :all_blank
  accepts_nested_attributes_for :attachments, :allow_destroy => true,:reject_if => :all_blank
  
  def get_status_highlight
    if self.status
      case self.status.name
        when   "Finalized - Convicted"
          "danger"
        when "Pending Committal to HC"
          "info"
        when "Finalized - Acquitted"
          "success"
        when "Pending Trial"
          "primary"
        when "Pending Judgement"
          "warning"
        else
          ""
      end
    else
      ""
    end
  end

  def self.text_search(query)
    if query.present?
      search_text(query)
    else
      scoped
    end

  end
  
  def self.ransackable_attributes(auth_object = nil)
        super & %w"rcci court_case_number court_type date_of_offence date_reported date_submitted date_trial_commenced date_trial_concluded judgment sentence"
  end

  def self.to_csv(records,options={})
    CSV.generate(options) do |csv|
      csv << column_names
      records.each do |cased|
        csv << cased.attributes.values_at(*column_names)
      end
    end
  end

  def self.generate_case_report(date = Date.today)
    charge_data = where(date_reported: (date-3.months)..date)
    charge_data = charge_data.group("date(date_reported)")
    charge_data = charge_data.select("date_reported, count(*) as case_count")

    ((date-3.months)..date).map do |day|
      {
          date_reported: day,
          case_count: charge_data[day].first.try(:case_count) || 0

      }
    end
  end

  def self.get_user_cases(user)
    if user.roles_name.find_index("admin") || user.roles_name.find_index("super_admin")
      scoped
    elsif user.roles_name.find_index("hc_prosecutor")
      where("user_id = :user_id OR status_id = :status_id",user_id: user.id, status_id: Status.find_by_name("Pending Committal to HC").id)
    elsif user.roles_name.find_index("prosecutor")
      where(:user_id => user.id)
    else
      self
    end
  end
end

