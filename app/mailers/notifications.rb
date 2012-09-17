class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.appointment_scheduler.subject
  #
  def appointment_scheduler(user_id, case_id)
    @user = User.find(user_id)
    @case = CaseDetail.find(case_id)
    mail to: (@user.email, subject: "#{@case.court_case_number} case on the #{@case.date_trial_commenced}") do |format|
      format.ics{
          ical = Icalendar::Calendar.new
          e = Icalendar::Event.new
          e.start = 
        
      }
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.reminder.subject
  #
  def reminder
    @greeting = "Hi"

    mail to: "to@example.org"
  end


end
