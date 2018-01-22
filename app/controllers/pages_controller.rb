class PagesController < ApplicationController
  def home
    @low_stock = Item.where(low_stock: true)
    @last_update = Entry.last.created_at
    @last_update_user = Employee.find(Entry.last.pin).name
    @entries_updated = Item.where('updated_at > ?', 1.week.ago).count
    @percent_updated = @entries_updated / Item.count * 100
    @waste = Waste.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
