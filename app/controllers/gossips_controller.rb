class GossipsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @gossips = Gossip.all
  end


  def new
    @gossip = Gossip.new
  end

  def create
    @gossip =  Gossip.new(gossip_params)
    current_user.gossips << @gossip
    if @gossip.save
    #fait appel à la fonction show avec l'id du gossip
      redirect_to @gossip
    else
      flash.now[:danger] = "Content can't be empty"
      render 'new'

    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to @gossip
  end

  def destroy
    Gossip.find(params[:id]).destroy
    redirect_to gossips_path
  end





  private
    def gossip_params
      params.require(:gossip).permit(:anonymous_author, :content)
    end
end
