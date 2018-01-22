class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update show destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = 'Item created.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Item not created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      flash.now[:success] = 'Item updated.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Item not updated.'
      render :edit
    end
  end

  def show
  end

  def index
    @items = Item.all.order(:name)
  end

  def destroy
    @item.destroy
    flash[:success] = 'Item deleted.'
  end

  private

  def set_item
    unless (@item = Item.find_by(id: params[:id]))
      flash[:warning] = 'Item not found.'
      redirect_to items_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :unit, :category, :threshold, :value)
  end
end
