module ChartsHelper
  def chart_data(records, period, attribute)
    records.group_by_period(period, :created_at).average(attribute)
  end
end