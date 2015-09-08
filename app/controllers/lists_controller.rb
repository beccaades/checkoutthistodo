class ListsController < ApplicationController
  def index
    @lists = List.order("created_at DESC")
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      if request.xhr?
        @lists = List.all
        # somehow only send back the html for the page update
        render :layout => false
      else
        redirect_to root_path
      end
    else
      @lists = List.all
      render :index
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render
    else
      render 'list/show'
    end
  end

  def destroy
    @list = List.find_by(params[:id])
    @list_id = params[:id]
    @list.destroy
    @lists = List.all

    respond_to do |format|
      format.html { redirect_to lists_path }
      format.js #rails default: go to views/todos/destroy.js.erb
    end
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end
