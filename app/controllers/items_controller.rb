class ItemsController < ApplicationController

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to :back    
    else
      @list = @item.list
      render 'list/show'
    end
  end

  private
    def item_params
      params.require(:item).permit(:content)
    end
end