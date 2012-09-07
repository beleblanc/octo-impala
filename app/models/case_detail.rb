class CaseDetail < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search, against:[:rcci,:court_case_number],
                  using:{tsearch:{dictionary:"english"}},
                  associated_against:{region: :name, status: :name, charges: :name}

  attr_accessible :accuseds_attributes, :complainants_attributes,:prosecutor_id, :judge_id, :rcci,
                  :court_case_number, :court_type, :date_of_offence, :region_id, :constituency_id,
                  :date_reported, :date_submitted, :action_taken, :status_id, :comment, :date_trial_commenced,
                  :date_trial_concluded, :judgment, :sentence, :complainant, :accused, :reason_for_acquittal,
                  :judge_remarks,:charge_ids ,:user_id, :attachments_attributes

  has_many :accuseds    , :dependent => :destroy
  has_many :complainants, :dependent => :destroy
  has_many :attachments, :as => :attacheable
  belongs_to :constituency
  belongs_to :region
  belongs_to :judge

  belongs_to :action
  belongs_to :status
  belongs_to :user
  has_and_belongs_to_many :charges


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
      search(query)
    else
      scoped
    end

  end


end

