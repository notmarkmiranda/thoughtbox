class Api::V1::LinksController < Api::V1::BaseController
  respond_to :json

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
	respond_with @link
    end
  end

  private
  def link_params
    params.require(:link).permit(:read)
  end
end
