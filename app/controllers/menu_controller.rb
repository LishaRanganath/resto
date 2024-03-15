class MenuController < ApplicationController
  def list
    @show_navbar=false
    @show_nav=true
    @menu=Menu.all
  end
end
