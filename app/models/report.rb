class Report
include LazyHighCharts

  def self.case_type_report(data, user)
  @graph = HighChart.new('column') do |c|
      Charge.all.each do |m|
        c.series(name: m.name, data: [m.case_details.where(user_id: user.id).count])
      end
      c.title({ :text=>"clickable bar chart"})
      c.legend({:align => 'right', 
               :x => -100, 
               :verticalAlign=>'top',
               :y=>20,
               :floating=>"true",
               :backgroundColor=>'#FFFFFF',
               :borderColor=>'#CCC',
               :borderWidth=>1,
               :shadow=>"false"
               })
      c.options[:chart][:defaultSeriesType] = "column"
      c.options[:chart][:width] = 600
      c.options[:xAxis] = {:plot_bands => "none", :title=>{:text=>"Time"}, :categories => []}
      c.options[:yAxis][:title] = {:text=>"Answers"}
      #c.options[:plot_options][:column] = {:stacking=>'normal',  :cursor => 'pointer' }
    end

    @graph
  end

end