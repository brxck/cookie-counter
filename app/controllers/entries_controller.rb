class EntriesController < ApplicationController
  def new
    if (@item = Item.find_by(id: params[:id]))
      @old_stock = @item.in_stock
      @old_order = @item.on_order
      @entry = @item.entries.build
    else
      flash[:danger] = 'Could not find item.'
      redirect_to items_path
    end
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:success] = 'Inventory updated.'
      redirect_to entry.item
    else
      flash.now[:danger] = 'Inventory could not be updated.'
      render :new
    end
  end

  def update
  end

  private

  def entry_params
    params.require(:entry).permit(:item_id, :employee_id, :quantity)
  end
end
