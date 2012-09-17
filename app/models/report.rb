class Report
include LazyHighCharts


  #Creating case type report for selected user
  def self.case_type_report(data, user)
  @case = HighChart.new('column') do |c|
      Charge.all.each do |m|
      c.series(name: m.name, data: [m.case_details.where(user_id: user.id).count])
      end
      c.title({ :text=>"clickable bar chart"})
      set_options(c, :y_axis_title=> "Amount", :x_axis_title=> "Charges")
      #c.options[:plot_options][:column] = {:stacking=>'normal',  :cursor => 'pointer' }
    end

    @case
  end
  #creating status type report for selected user
  def self.status_type_report(data, user)
    @status = HighChart.new('column') do |c|
          Status.all.each do |m|
            c.series(name: m.name, data: [m.case_details.where(user_id: user.id).count])
          end
          c.title({ :text=>"Case Status Report"})
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

#generating the reports as attachments and then mailing them
def self.generate_weekly_report
  @status = Status.all.each.map {|map| [map.name,map.case_details.count]}
  @charges = Charge.all.each.map {|map| [map.name,map.case_details.where(:date_trial_commenced => Date.today.beginning_of_week..Date.today.end_of_week).count]}
  Role.find_by_name(:admin).users.each { |user| ReportNotification.weekly_report(user,@status,@charges).deliver}
end

def self.generate_monthly_report
  @status = Status.all.each.map {|map| [map.name,map.case_details.count]}
  @charges = Charge.all.each.map {|map| [map.name,map.case_details.where(:date_trial_commenced => Date.today.beginning_of_month..Date.today.end_of_month).count]}
  Role.find_by_name(:admin).users.each { |user| ReportNotification.monthly_report(user,@status,@charges).deliver}
end


end