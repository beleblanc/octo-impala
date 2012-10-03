class Report
include LazyHighCharts


  #Creating case type report for selected user
  def self.case_type_report(data, user)
  @case = HighChart.new('column') do |c|
      Charge.all.each do |m|

          if m.case_details.get_user_cases(user).where(:date_reported=> 3.months.ago..Date.today).count > 0
            c.series(name: m.name, data: [m.case_details.get_user_cases(user).where(:date_reported=> 3.months.ago..Date.today).count])
          end

      end
      c.title({ :text=>"Charges Report (90 day overview)"})
      set_options(c, :y_axis_title=> "Amount", :x_axis_title=> "Charges")
      #c.options[:plot_options][:column] = {:stacking=>'normal',  :cursor => 'pointer' }
    end

    @case
  end
  #creating status type report for selected user
  def self.status_type_report(data, user)
    @status = HighChart.new('column') do |c|
          Status.all.each do |m|
            if m.case_details.get_user_cases(user).where(:date_reported=> 3.months.ago..Date.today).count > 0
                c.series(name: m.name, data: [m.case_details.get_user_cases(user).where(:date_reported=> 3.months.ago..Date.today).count])
            end
          end
          c.title({ :text=>"Case Status Report (90 day overview)"})
          set_options(c,:y_axis_title=>"Amount", :x_axis_title=>"Status")
          #c.options[:plot_options][:column] = {:stacking=>'normal',  :cursor => 'pointer' }
        end

        @status
  end
  #setting options for chart
  def self.set_options(block_variable, options={})

    block_variable.legend({:align => 'right',
                       :x => 10,
                       :verticalAlign=>'top',
                       :y=>20,
                       :floating=>"true",
                       :backgroundColor=>'#FFFFFF',
                       :borderColor=>'#CCC',
                       :borderWidth=>1,
                       :shadow=>"false"
                       })
    block_variable.options[:chart][:defaultSeriesType] = "column"
    block_variable.options[:chart][:width] = 500
    block_variable.options[:xAxis] = {:plot_bands => "none", :title=>{:text=>options[:x_axis_title]}, :categories => []}
    block_variable.options[:yAxis][:title] = {:text=>options[:y_axis_title]}

  end

#generating the reports and then mailing them
  def self.generate_weekly_report

    Role.find_by_name(:admin).users.each { |user| ReportNotification.weekly_report(user).deliver}
  end

  def self.generate_monthly_report
     Role.find_by_name(:admin).users.each { |user| ReportNotification.monthly_report(user).deliver}
  end



end