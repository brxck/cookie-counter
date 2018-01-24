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
    if params[:period]
      @period = params[:period].downcase.to_sym
    else
      @period = :week
    end

    @entries = @item.entries.order(created_at: :desc)
    
    @stock_data = @entries.group_by_period(@period, :created_at).average(:in_stock)
    @order_data = @entries.group_by_period(@period, :created_at).average(:on_order)
    @waste_data = @item.wastes.group_by_period(@period, :created_at).average(:quantity)
  end

  def index
    @items = Item.all.order(:name)
  end

  def destroy
    @item.destroy
    flash[:success] = 'Item deleted.'
    redirect_to items_path
  end

  def search
    @items = Item.where('name LIKE ?', "%#{params[:item_name]}%")
    if @items.count == 1
      redirect_to @items.first
    elsif @items.none?
      flash[:info] = 'No items found.'
      redirect_to root_path
    else
      render :index
    end
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
