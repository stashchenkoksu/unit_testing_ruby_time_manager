# frozen_string_literal: true

class TimeManager
  attr_accessor :periods
  def initialize(periods)
    @periods = periods.sort.uniq
    optimize
  end

  def optimize
    i = 0
    until periods[i + 1].nil?
      if periods[i].first < periods[i].last
        if periods[i].last >= periods[i + 1].first
          periods[i][1] = periods[i + 1].last
          periods.delete(periods[i + 1])
        end
      else
        periods.delete(periods[i])
      end
      i += 1
    end
  end

  def free_time
    free_time = []
    return free_time if periods.size == 1

    i = 0
    until periods[i + 1].nil?
      free_time << [periods[i].last, periods[i + 1].first] if periods[i].last != periods[i + 1].first
      i += 1
    end
    free_time
  end
end
