require "weekdays/version"

module Weekdays
  def self.number_of_weekdays_after_today(n)
    total = n.to_i
    return 0 if total == 0
    grace_period = 0
    grace_period += 2 if start_date.saturday?
    grace_period += 1 if start_date.sunday?
    while(total > 1) do
      total        -= 1
      grace_period += 1
      grace_period += 1 if (start_date + grace_period.days).saturday?
      grace_period += 1 if (start_date + grace_period.days).sunday?
    end

    start_date + grace_period.days
  end
end
