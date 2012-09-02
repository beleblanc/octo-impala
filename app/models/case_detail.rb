class CaseDetail < ActiveRecord::Base
  attr_accessible :accuseds_attributes, :complainants_attributes,:prosecutor_id, :judge_id, :rcci,
                  :court_case_number, :court_type, :date_of_offence, :region_id, :constituency_id,
                  :date_reported, :date_submitted, :action_taken, :status_id, :comment, :date_trial_commenced,
                  :date_trial_concluded, :judgment, :sentence, :complainant, :accused, :reason_for_acquittal,
                  :judge_remarks,:charge_ids

  has_many :accuseds    , :dependent => :destroy
  has_many :complainants, :dependent => :destroy
  belongs_to :constituency
  belongs_to :region
  belongs_to :judge
  belongs_to :prosecutor
  belongs_to :action
  belongs_to :status
  has_and_belongs_to_many :charges


  accepts_nested_attributes_for :accuseds , :allow_destroy => true,:reject_if => :all_blank
  accepts_nested_attributes_for :complainants, :allow_destroy => true,:reject_if => :all_blank
  
  def get_status_highlight
    case self.status.name
    when "Pending", "Trial Date Set"
      "danger"
    when "Awaiting Judgment", "Tried"
      "info"
    when "Convicted", "Withdrawn","Acquited" ,"Completed","" 
      "success"
    else
      ""
    end
  end

  2.hours
end

