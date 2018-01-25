module ChartsHelper
  def chart_avg(records, period, attribute)
    records.group_by_period(period, :created_at).average(attribute)
  end

  def chart_sum(records, period, attribute)
    records.group_by_period(period, :created_at).sum(attribute)
  end

  def chart_periods
    options_for_select([['Day', 'day'], ['Week', 'week'], ['Month', 'month'], ['Year', 'year']])
  end
end