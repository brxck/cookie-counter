class EntriesController < ApplicationController
  before_action :set_item, only: %i[new create]

  def new
    @old_stock = @item.in_stock
    @old_order = @item.on_order
    @entry = @item.entries.build
  end

  def create
    @entry = @item.entries.build(entry_params)
    if @entry.save
      flash[:success] = 'Inventory updated.'
      redirect_to @entry.item
    else
      flash.now[:danger] = 'Inventory could not be updated.'
      render :new
    end
  end

  def index
    if (@item = Item.find_by(id: params[:id]))
      @entries = @item.entries.all
    else
      flash[:danger] = "Item not found."
      redirect_to items_path
    end
  end
  
  private

  def set_item
    unless (@item = Item.find_by(id: params[:id]))
      flash[:danger] = 'Item not found.'
      redirect_to items_path
    end
  end

  def entry_params
    params.require(:entry).permit(:in_stock, :on_order, :pin, :quantity)
  end
end
