class ReportNotification < ActionMailer::Base
  default from: "from@example.com"


  def weekly_report(user, date = Date.today)
    @date = date
    @date_range = @date.beginning_of_week..@date.end_of_week
    @status = Status.all.each.map {|map| [map.name,map.case_details.where(:date_reported=> @date.beginning_of_month..@date.end_of_month).count]}
    @charges = Charge.all.each.map {|map| [map.name,map.case_details.where(:date_reported=> @date.beginning_of_month..@date.end_of_month).count]}
    @user = user

     mail to: @user.email, from: "no-reply@dppoffice.co.sz", subject:"Weekly Report for the week of
      #{Date.today.beginning_of_week} to #{Date.today.end_of_week}"
  end

  def monthly_report(user,date = Date.today)
      @date = date
      @user = user
      @date_range = @date.beginning_of_month..@date.end_of_month
      @status = Status.all.each.map {|map| [map.name,map.case_details.where(:date_reported=> @date.beginning_of_month..@date.end_of_month).count]}
      @charges = Charge.all.each.map {|map| [map.name,map.case_details.where(:date_reported=> @date.beginning_of_month..@date.end_of_month).count]}
      mail to: @user.email, from: "no-reply@dppoffice.co.sz", subject:"Monthly Report for the month of #{Date.today.strftime("%B")}"

  end

end
