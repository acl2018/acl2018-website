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
      current_parallel_sessions = []
      par_ses_num = 1
      max_concurrent = 0

      File.open("_data/softconf-schedule-raw.txt").each do |line|
      	if line.match(/^[*+=] /)
      		in_multiline_session = false
      		papers = []
      	end
         if (line.match(/^[+*] /)) and current_parallel_sessions.size > 0
            by_start = Hash.new {[]}
            # need to split up if multiple start times appear in here
            current_parallel_sessions.each do |sess|
               by_start[sess['start']] = by_start[sess['start']].push(sess)
            end
            all_starts = by_start.keys.sort
            all_starts.each do |start|
               par_sessions = by_start[start]  
               parallel_session_top = {
                  'name' => "Presentations #{par_ses_num}",
                  'start' => par_sessions[0]['start'],
                  'end' => par_sessions[0]['end'],
                  'shared' => false,
                  'concurrent_sessions' => par_sessions,
               }
               if par_sessions.size > max_concurrent
                  max_concurrent = par_sessions.size
               end
               day_sessions.push(parallel_session_top)
               par_ses_num += 1
            end
            current_parallel_sessions = []
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
      		session = {
      			'start' => start_time,
      			'end' => end_time,
      			'shared' => true,
      		}
            chair_match = session_title.match(/ %chair (.*)$/)
            if chair_match
               session['chair'] = chair_match[1]
               session_title = session_title[0..-(chair_match[0].size + 1)]
            end
            by_match = session_title.match(/ %by (.*)$/)
            if by_match
               session['speakers'] = by_match[1]
               session_title = session_title[0..-(by_match[0].size + 1)]
            end
            session['name'] = session_title
      		papers = []
      		in_multiline_session = true
            if line.start_with?('+ ') # shared
               day_sessions.push(session)
            else #parallel
               current_parallel_sessions.push(session)
            end
      	end
      end

      schedule = {
      	'days' => all_days,
         'num_concurrent' => max_concurrent,
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