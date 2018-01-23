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
    @items = Item.all.order(name: :asc)
  end

  def update
    params[:update].each do |item_id|
      item = Item.find(item_id)
      entry = item.entries.build(in_stock: params[:items][item_id][:in_stock],
                                 on_order: params[:items][item_id][:on_order],
                                 pin: params[:pin])
      next if entry.save
      flash.now[:danger] = 'Could not update inventory.'
      render :index
    end
    flash[:success] = 'Inventory updated.'
    redirect_to items_path
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
