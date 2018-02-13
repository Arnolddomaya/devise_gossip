class HomeController < ApplicationController


  def index
    @gossips = Gossip.all
    if  user_signed_in?
      redirect_to gossips_path
    end 
  end




end
