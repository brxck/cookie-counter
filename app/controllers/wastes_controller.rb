class WastesController < ApplicationController
  before_action :set_item, only: %i[new update create]

  def new
    @waste = @item.wastes.build
    @items = Item.all.map { |item| [item.name, item.id] }
  end

  def create
    @waste = @item.wastes.build(waste_params)
    if @waste.save
      flash[:success] = 'Entry added to waste sheet.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Could not add entry.'
      render :new
    end
  end

  private

  def set_item
    if (name = params.dig(:waste, :item_name))
      @item = Item.find_by(name: name)
    else
      @item ||= Item.find_by(id: params[:id])
    end

    unless @item
      flash[:danger] = 'Item not found.'
      redirect_to items_path # TODO: replace with wastes
    end
  end

  def waste_params
    params.require(:waste).permit(:quantity, :pin)
  end
end
