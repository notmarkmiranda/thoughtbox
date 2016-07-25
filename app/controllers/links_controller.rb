class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Submitted \"#{@link.title}\"!"
      redirect_to links_path
    else
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :link)
  end
end
