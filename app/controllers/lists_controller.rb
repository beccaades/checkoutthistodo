class ListsController < ApplicationController

  def index
    @lists = List.order("created_at DESC")
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      @lists = List.all
      render :index
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end

end
