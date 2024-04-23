class LinksController < ApplicationController
  before_action :set_link, only: [:show, :redirect]

  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def show
    if @link
      render json: @link
    else
      render json: { error: 'Link not found' }, status: :not_found 
    end
  end

  def redirect
    if @link
      @link.increment!(:visit)
      redirect_to @link.store_url
    else
      render json: { error: 'Link not found' }, status: :not_found 
    end
  end

  private

  def set_link
    @link = Link.find_by(tracking_code: params[:tracking_code])
  end

  def link_params
    params.require(:link).permit(:store_url)
  end
end
