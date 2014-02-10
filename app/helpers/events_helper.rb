module EventsHelper

	def generate_events(scheduleid)
		@roommates = Roommate.where(scheduleid: scheduleid).all
		@tasks = Task.where(scheduleid: scheduleid).all

		@tasks.each do |task|
			@event = Event.new(title: 'TESTTTTT', start: task.startday.to_date, end: task.endday.to_date, scheduleid: scheduleid)
			@event.save!
		end
	end

end
