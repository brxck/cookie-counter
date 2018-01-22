class EntriesController < ApplicationController
  def new
    @entry = Entry.new
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
