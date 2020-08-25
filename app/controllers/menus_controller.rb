class MenusController < ApplicationController
  def show
    @menu = Menu.find(params[:id])
    authorize @menu
  end
end
