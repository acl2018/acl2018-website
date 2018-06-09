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
			current_talks = []

		 	times_from_chunk = lambda do |line_remainder|
				time_chunk = line_remainder[0..12]
				start_str, end_str = time_chunk.split('--')
				start_time = Time.parse(start_str, date.to_time)
				end_time = Time.parse(end_str, date.to_time)
				return [start_time, end_time]
			end			

			File.open("_data/softconf-schedule-raw.txt").each do |line|
				if (line.match(/^[*+=] /) or line.chomp.size == 0) \
						and current_talks.size > 0 and current_parallel_sessions.size > 0
					most_recent_par_session = current_parallel_sessions[-1]
					most_recent_par_session['talks'] = current_talks
					most_recent_par_session['start'] = current_talks[0]['start']
					most_recent_par_session['end'] = current_talks[-1]['end']
					current_talks = []
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
						stream_num = 1
						par_sessions.each do |ps|
							ps['talks'].each do |talk|
								session_id = "#{day_num}_#{talk['start'].strftime('%H%M')}-#{stream_num}"
								talk['sess_id'] = session_id
							end
							stream_num += 1
						end
						# print(par_sessions)
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
						start = parallel_session_top['start']
						if not day_sessions.has_key?(start)
							day_sessions[start] = []
						end
						day_sessions[start].push(parallel_session_top)
						par_ses_num += 1
					end
					current_parallel_sessions = []
				end
				if line.start_with?('* ')
					day_num += 1
					day_sessions = {}
					date = DateTime.parse(line[2..-1])
					day = {
						'sessions_by_time' => day_sessions, 
						'date' => date.to_s, 
						'name' => "Day #{day_num}",
					}
					all_days.push(day)
				elsif line.start_with?('= ')
					conts = line[2..-1]
					session_title = conts
					# session = {
					# 	'start' => start_time,
					# 	'end' => end_time,
					# 	'shared' => true,
					# 	'sess_id' => "#{day_num}_#{start_time.strftime('%H%M')}"
					# }
					# chair_match = session_title.match(/ %chair (.*)$/)
					# if chair_match
					# 	session['chair'] = chair_match[1]
					# 	session_title = session_title[0..-(chair_match[0].size + 1)]
					# end
					# by_match = session_title.match(/ %by (.*)$/)
					# if by_match
					# 	session['speakers'] = [by_match[1]]
					# 	session_title = session_title[0..-(by_match[0].size + 1)]
					# end
					session = {
						'name' => session_title,
						'shared' => false
					}
					papers = []
					in_multiline_session = true
					current_parallel_sessions.push(session)
				elsif line.start_with?('+ ')
					conts = line[2..-1]
					start_time, end_time = times_from_chunk[conts]
					session_title = conts[12..-1]
					session = {
						'start' => start_time,
						'end' => end_time,
						'shared' => true,
						'sess_id' => "#{day_num}_#{start_time.strftime('%H%M')}"
					}
					session['name'] = session_title.strip
					papers = []
					in_multiline_session = true
					if !day_sessions.has_key?(start_time)
						day_sessions[start_time] = []
					end
					day_sessions[start_time].push(session)
				elsif line.chomp.size > 0 and line.match(/ \d\d:\d\d--\d\d:\d\d /) # talk
					talk_id = line.split()[0]
					conts = line[(talk_id.size + 1)..-1]
					start_time, end_time = times_from_chunk[conts]
					remainder = conts[12..-1]
					puts remainder
					title_author_match = remainder.match(/^ # ([^#]+) # ([^#]+)/)
					talk = {
						'id' => talk_id,
						'start' => start_time,
						'end' => end_time,
					}					
					if title_author_match
						talk['speakers'] = [title_author_match[2].strip]
						title = title_author_match[1].strip
					else
						title = ''
					end
					talk['name'] = title
					current_talks.push(talk)
				end
			end

			all_days.each do |day|
				sessions = []
				sessions_by_time = day['sessions_by_time']
				all_starts = sessions_by_time.keys.sort
				all_starts.each do |start|
					sessions_at_time = sessions_by_time[start]
					if sessions_at_time.size == 1
						sessions.push(sessions_at_time[0])
					else
						stream_num = 1
						sessions_at_time.each do |sess|
							sess['shared'] = false
							sess['sess_id'] = "#{sess['sess_id']}-#{stream_num}"
							stream_num += 1
						end
						par_sess = {
							'shared' => false,
							'name' => 'Poster Session',
							'start' => sessions_at_time[0]['start'],
							'end' => sessions_at_time[0]['end'],
							'concurrent_sessions' => sessions_at_time
						}
						sessions.push(par_sess)
					end
				end
				day['sessions'] = sessions
			end
			schedule = {
				'days' => all_days,
				'num_concurrent' => max_concurrent,
			}

			site.config['main_schedule'] = schedule

		end
  end
end