class TimeManager
	attr_accessor :periods
	def initialize(periods)
		@periods = periods.sort.uniq
	end

	def optimize
		i = 0
		until periods[i + 1].nil?
			if(periods[i].first < periods[i].last)
				if (periods[i].last > periods[i + 1].first)
					periods[i][1] = periods[i+1].last
					periods.delete(periods[i+1])
				end
			else
				periods.delete(periods[i])
			end
			i+=1
		end
	end

	def get_free_time
		free_time = []
		i = 0
		until periods[i + 1].nil?
			free_time << [periods[i].last, periods[i+1].first]
			i+=1
		end
		free_time
	end


end

tm = TimeManager.new([%w[10:00 11:20], %w[10:00 11:00], %w[11:50 12:00], %w[12:10 13:00], %w[10:00 10:20]])
tm.optimize
puts tm.periods.to_s
puts tm.get_free_time.to_s
