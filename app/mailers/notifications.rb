class Notifications < ActionMailer::Base
  default from: "notifications@dpp.gov.sz"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.appointment_scheduler.subject
  #
  def appointment_scheduler(user_id, case_id)
    @user = User.find(user_id)
    @case = CaseDetail.find(case_id)
    mail(to: @user.email,:subject => "#{@case.court_case_number} case on the #{@case.date_trial_commenced}") do |format|
      format.ics{
          ical = Icalendar::Calendar.new
          e = Icalendar::Event.new
          e.start = @case.date_trial_commenced.to_datetime.beginning_of_day.utc
          e.start.icalendar_tzid = "UTC"
          e.end = @case.date_trial_commenced.to_datetime.end_of_day.utc
          e.end.icalendar_tzid = "UTC"
          e.organizer = "notification@dpp.gov.sz"
          e.uid = "CaseReminder:#{@case.court_case_number}"
          e.summary "Case Reminder: #{@case.court_case_number}"
          e.description <<-EOF
            Court case reminder for case: #{@case.court_case_number} on the #{@case.date_trial_commenced.strftime("%A, %d %B")}
          EOF
          ical.add_event(e)
          ical.publish

          render :text => ical.to_ical,:layout => false

        
      }
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.reminder.subject
  #



end
