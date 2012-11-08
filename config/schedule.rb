set :output, "#{path}/log/cron.log"
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every :saturday, at: "11:50 pm" do
  runner "Report.generate_weekly_report"
end

every :day, at: "6:50 am" do
  runner "Notifications.daily_case_reminder.deliver"
end

# Learn more: http://github.com/javan/whenever
