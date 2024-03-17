class SearchController < ApplicationController
  def index
    @show_nav=true
    @menu=Menu.all
    if params[:query].present?
      @menu=@menu.where("name LIKE ?", "%#{params[:query]}%")
    end
  end
end
