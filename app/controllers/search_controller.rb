class SearchController < ApplicationController
  def index
    @menu=Menu.all
    if params[:query].present?
      @menu=@menu.where("name LIKE ?", "%#{params[:query]}%")
    end
  end
end
