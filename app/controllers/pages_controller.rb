class PagesController < ApplicationController
  def home
    @low_stock = Item.all.entries.last.where('entry.in_stock <= threshold')
  end
end
