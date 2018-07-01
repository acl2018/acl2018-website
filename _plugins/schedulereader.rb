require 'date'
require 'time'

module ScheduleReader
  	class Generator < Jekyll::Generator

  		@@stream_locations = [
			'Plenary, MCEC',
			'Room 203/204, MCEC',
			'Room 210/211, MCEC',
			'Room 212/213, MCEC',
			'Room 219, MCEC',
			'Room 220, MCEC',
  		]

  		def read_single_metadata(filename, id_suffix)
  			paper = {'authors' => []}
  			author_first_name = nil
  			in_abstract = false
  			File.open(filename).each do |line| 
  				subnum_match = line.match /^SubmissionNumber#=%=#(\d+)$/
  				abst_match = line.match /^Abstract#==#(.*)$/
  				author_first_match = line.match /^Author\{\d+\}\{Firstname\}#=%=#(.+)$/
  				author_last_match = line.match /^Author\{\d+\}\{Lastname\}#=%=#(.+)$/
  				title_match = line.match /^FinalPaperTitle#=%=#(.+)/
  				any_field_match = line.match /^[\w{}]+#=%?=#/
  				if subnum_match
  					# puts "found id '#{subnum_match[1]}'"
  					paper['id'] = subnum_match[1].strip + id_suffix
				elsif abst_match
					paper['abstract'] = abst_match[1].strip
					in_abstract = true
				elsif author_first_match
					author_first_name = author_first_match[1].strip
				elsif author_last_match
					last_name = author_last_match[1].strip
					author = "#{author_first_name} #{last_name}"
					paper['authors'].push(author)
					author_first_name = nil
				elsif title_match
					paper['title'] = title_match[1].strip
				elsif any_field_match
					in_abstract = false
				elsif in_abstract
					paper['abstract'] += ' ' + line.strip 
				end
  			end
  			paper
  		end

  		def read_bulk_metadata(filepath, id_suffix = "")
  			papers = {}
  			# puts "#{filepath}/final/*/*_metadata.txt"
  			Dir.glob("#{filepath}/final/*/*_metadata.txt") do |file|
  				single = read_single_metadata(file, id_suffix)
  				papers[single['id']] = single
  			end
  			return papers
  		end


  		def read_all_metadata() 
  			root = "_data/from-handbook"
  			main_papers = read_bulk_metadata("#{root}/papers", "")
  			add_short_long(main_papers)
  			srw_papers = read_bulk_metadata("#{root}/srw", "/SRW")
 			srw_papers.values.each { |paper| paper['format'] = 'srw' }
 			demo_papers = read_bulk_metadata("#{root}/demos", "/DEMO")
			demo_papers.values.each { |paper| paper['format'] = 'demo' }
  			return main_papers.merge(srw_papers).merge(demo_papers)
  		end

  # 		def read_acl_db(file_prefix, id_suffix)
  # 			all_papers = {}
		# 	paper = {'authors' => []}
		# 	File.open("#{file_prefix}/db.withoutmargins").each do |line|
		# 		line = line.chomp
		# 		if line.size == 0
		# 			all_papers[paper['id']] = paper
		# 			paper = {'authors' => []}
		# 		end
		# 		key, value = line.split(/: /, 2)
		# 		if key == 'P'
		# 			paper['id'] = "#{value}#{id_suffix}"
		# 		elsif key == 'T'
		# 			paper['title'] = value
		# 		elsif key == 'A'
		# 			last, first = value.split(', ')
		# 			paper['authors'].push("#{first} #{last}")
		# 		end
		# 	end
		# 	return all_papers
		# end

		# def read_demo_metadata()
		# 	demos = read_acl_db("_data/demo-metadata", "/DEMO")

		# 	return demos
		# end

  # 		def read_paper_metadata()
  # 			all_papers = read_acl_db("_data/paper-metadata", "")
  # 			all_papers.each do |key, paper|
  # 				paper['abstract'] = read_abstract(key)
  # 			end
			# File.open("_data/paper-metadata/acl18-shortlong-ids.tsv").each do |line|
			# 	line = line.chomp
			# 	id, length = line.split("\t")
			# 	paper = all_papers[id]
			# 	if not paper
			# 		puts("no paper '#{id}'")
			# 	else
			# 		paper['format'] = length.downcase == "long" ? 'long' : 'short'
			# 	end
			# end
		# 	return all_papers
		# end

		# def read_all_metadata()
		# 	return read_demo_metadata().merge(read_paper_metadata())
		# end

		def add_short_long(all_papers) 
			File.open("_data/paper-metadata/acl18-shortlong-ids.tsv").each do |line|
				line = line.chomp
				id, length = line.split("\t")
				paper = all_papers[id]
				if not paper
					puts("no paper '#{id}'")
				else
					paper['format'] = length.downcase == "long" ? 'long' : 'short'
				end
			end
		end			

		def get_location(session)
			sn = session['stream_num']
			if sn 
				return @@stream_locations[sn]
			else
				ses_name = session['name']
				if ses_name.end_with?(' Break')
					return 'Level 2 Foyer and Melbourne Room'
				elsif ses_name == 'Social Event'
					return 'Melbourne Aquarium'
				elsif ses_name.start_with?('Poster Session')
					return 'Melbourne Room 1 and 2, MCEC'						
				else
					return 'Plenary, MCEC'
				end
			end
		end

  		def read_schedule(metadata)
			all_days = []
			day_num = 0
			in_multiline_session = false
			date = nil
			day_sessions = nil
			current_parallel_sessions = []
			par_ses_num = 1
			max_concurrent = 0
			current_talks = []
			current_posters = []
			most_recent_shared_session = nil

		 	times_from_chunk = lambda do |line_remainder|
				time_chunk = line_remainder[0..12]
				start_str, end_str = time_chunk.split('--')
				start_time = Time.parse(start_str, date.to_time)
				end_time = Time.parse(end_str, date.to_time)
				return [start_time, end_time]
			end			

			File.open("_data/softconf-schedule-with-extras.txt").each do |line|
				if (line.match(/^[*+=] /) or line.chomp.size == 0)
					if current_parallel_sessions.size > 0 and current_talks.size > 0
						most_recent_par_session = current_parallel_sessions[-1]
						most_recent_par_session['talks'] = current_talks
						most_recent_par_session['start'] = current_talks[0]['start']
						most_recent_par_session['end'] = current_talks[-1]['end']
						current_talks = []
					end
					if most_recent_shared_session != nil and current_posters.size > 0
						most_recent_shared_session['posters'] = current_posters
						current_posters = []
						most_recent_shared_session = nil
					end
				end
				if (line.match(/^[*+=] /) or line.chomp.size == 0) \
						and current_posters.size > 0 and current_parallel_sessions.size > 0
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
						papers_are_short = par_sessions.all? do |ps|
							ps['short_papers']
						end
						suffix = papers_are_short ? 'Short Papers' : 'Long Papers and TACL Papers'
						start_time = par_sessions[0]['start']
						parallel_session_top = {
							'name' => "Oral Presentations #{par_ses_num}",
							'suffix' => suffix,
							'start' => start_time,
							'end' => par_sessions[0]['end'],
							'shared' => false,
							'concurrent_sessions' => par_sessions,
							'is_posters' => false,
							'sess_id' => "#{day_num}_#{start_time.strftime('%H%M')}",
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
					session_title = conts.strip
					chair_re = / %chair ([[:alpha:]. -]+)$/
					chair_match = session_title.match(chair_re)
					chair = ''
					if chair_match
						chair = chair_match[1]
						session_title = session_title.sub(chair_re, '')
					end
					is_short = session_title.end_with?(' (Short)')
					session_title = session_title.sub(/ \(Short\)$/, '')
					session = {
						'name' => session_title,
						'shared' => false,
						'short_papers' => is_short,
						'chair' => chair,
						'stream_num' => current_parallel_sessions.size,
					}
					session['location'] = get_location(session)
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
					session['location'] = get_location(session)
					papers = []
					in_multiline_session = true
					if !day_sessions.has_key?(start_time)
						day_sessions[start_time] = []
					end
					most_recent_shared_session = session
					day_sessions[start_time].push(session)
				elsif line.chomp.size > 0 and line.match(/ \d\d:\d\d--\d\d:\d\d /) # talk
					talk_id = line.split()[0]
					conts = line[(talk_id.size + 1)..-1]
					start_time, end_time = times_from_chunk[conts]
					remainder = conts[12..-1]
					is_tacl = talk_id.end_with?('/TACL')
					talk = {
						'id' => talk_id,
						'start' => start_time,
						'end' => end_time,
						'is_tacl' => is_tacl
					}
					if metadata.has_key?(talk_id)
						extra = metadata[talk_id]
						talk['name'] = extra['title']
						talk['speakers'] = extra['authors']
						talk['abstract'] = extra['abstract']
					else
						title_author_match = remainder.match(/^ *# (.+) # (.+)/)					
						if title_author_match
							talk['name'] = title_author_match[1].strip
							talk['speakers'] = [title_author_match[2].strip]
						else
							puts "No paper title author match in '#{remainder}"
						end
					end
					current_talks.push(talk)
				elsif line.chomp.size > 0 # poster
					poster_id = line.split()[0]
					remainder = line[(poster_id.size + 1)..-1]
					is_tacl = poster_id.end_with?('/TACL')
					poster = {
						'id' => poster_id,
						'is_tacl' => is_tacl,
						'poster' => true
					}
					if metadata.has_key?(poster_id)
						extra = metadata[poster_id]
						poster['name'] = extra['title']
						poster['speakers'] = extra['authors']
						poster['abstract'] = extra['abstract']
					else
						title_author_match = remainder.match(/^ *# (.+) # (.+)/)					
						title_match = remainder.match(/^ *# (.+)$/)					
						if title_author_match
							poster['name'] = title_author_match[1].strip
							poster['speakers'] = [title_author_match[2].strip]
						elsif title_match
							poster['name'] = title_match[1].strip
							poster['speakers'] = []
						else
							puts "No poster title(/author) match in '#{remainder}"
						end
					end
					current_posters.push(poster)
				end
			end

			all_days.each.with_index(1) do |day, day_num|
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
						start_time = sessions_at_time[0]['start']
						end_time = sessions_at_time[0]['end']
						par_sess = {
							'shared' => false,
							'name' => 'Poster Session',
							'start' => start_time,
							'end' => end_time,
							'concurrent_sessions' => sessions_at_time,
							'is_posters' => true,
							'sess_id' => "#{day_num}_#{start_time.strftime('%H%M')}",
						}
						sessions.push(par_sess)
					end
				end
				day['sessions'] = sessions
				day.delete('sessions_by_time')
			end
			schedule = {
				'days' => all_days,
				'num_concurrent' => max_concurrent,
			}
			return schedule
		end

		def generate(site)
			paper_meta = read_all_metadata
			site.config['main_schedule'] = read_schedule(paper_meta)
			papers = paper_meta.values
			site.config['main_paper_metadata'] = {'all' => paper_meta}
		end
  	end
end