class ReportNotification < ActionMailer::Base
  default from: "from@example.com"


  def weekly_report(user,status,charges)
    @status = status
    @charges = charges
    @user = user

     mail to: @user.email, from: "no-reply@dppoffice.co.sz", subject:"Weekly Report for the week of
      #{Date.today.beginning_of_week} to #{Date.today.end_of_week}"
  end

  def monthly_report(user,status,charges)
      @status = status
      @charges = charges
      @user = user

       mail to: @user.email, from: "no-reply@dppoffice.co.sz", subject:"Monthly Report for the month of #{Date.today.strftime("%B")}"

  end

end
