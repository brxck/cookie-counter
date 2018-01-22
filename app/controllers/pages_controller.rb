class PagesController < ApplicationController
  def home
    @low_stock = Item.where(low_stock: true)
    @last_update = Entry.last.created_at
    @entries_updated = Entry.distinct.select(:item_id).where('updated_at > ?', 1.week.ago).count
    @percent_updated = @entries_updated / Item.count * 100
    @waste = Waste.where(created_at: Date.today)
  end
end
