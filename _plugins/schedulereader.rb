require 'date'
require 'time'

module ScheduleReader
  class Generator < Jekyll::Generator
    def generate(site)
      # site.pages.each { |page| page.data['schedule'] = 'foo'}
      all_days = []
      day_num = 0
      in_multiline_session = false
      date = nil
      day_sessions = nil
      # date = DateTime.new(2018, 5, 1)
      # day_sessions = []
      File.open("_data/softconf-schedule-raw.txt").each do |line|
      	if line.match(/^[*+=] /)
      		in_multiline_session = false
      		papers = []
      	end	
      	if line.start_with?('* ')
      		day_num += 1
	  		day_sessions = []
	  		date = DateTime.parse(line[2..-1])
	  		day = {
	  			'sessions' => day_sessions, 
	  			'date' => date.to_s, 
	  			'name' => "Day #{day_num}",
	  		}
	  		all_days.push(day)
      	elsif line.start_with?('+ ') or line.start_with?('= ')
      		conts = line[2..-1]
      		time_chunk = conts[0..12]
      		start_str, end_str = time_chunk.split('--')
      		start_time = Time.parse(start_str, date.to_time)
      		end_time = Time.parse(end_str, date.to_time)
      		session_title = conts[12..-1]
      		current_session = {
      			'name' => session_title,
      			'start' => start_time,
      			'end' => end_time,
      			'shared' => true,
      		}
      		day_sessions.push(current_session)
      		papers = []
      		in_multiline_session = true
      	end
      end

      schedule = {
      	'days' => all_days
      }

      site.config['main_schedule'] = schedule

      # site.config['main_schedule'] = {
      # 	'days' => [
      # 		{
      # 			'name' => 'Day 1',
   	 	# 		'date' => '2018-07-16',
    		# 	'sessions' => [],
      # 		},
      # 	]
      # }
      # site.config['foo1'] = 'bar1'
    end
  end
end