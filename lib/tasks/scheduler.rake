desc "This task is called by the Heroku scheduler add-on"
task :first_hook => :environment do
  puts "Loading first hook of Buddy-bot ..."
    Schedule.create(batch: Batch.first, topic: Topic.first, post_at: Datetime.today)
    schedules = Schedule.where(posted: false)
    schedules.sending
  puts "done."
end
