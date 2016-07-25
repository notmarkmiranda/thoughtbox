class LinksController < ApplicationController
  before_action :require_user
  
  def index
    @links = Link.all
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Submitted \"#{@link.title}\"!"
      redirect_to links_path
    else
      flash[:warning] = "The world is dying!"
      render :index
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "edited, yup!"
      redirect_to root_path
    else
      flash[:warning] = "not edited, you forgot something"
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :link)
  end
end
