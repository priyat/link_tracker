class LinksController < ApplicationController
  before_action :set_link, only: [:show, :redirect]

  # POST /links
  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # GET /links/:tracking_code
  def show
    render json: @link
  end

  # GET /:tracking_code
  def redirect
    @link.increment!(:visit)
    redirect_to @link.store_url, allow_other_host: true
  end

  private

  def set_link
    @link = Link.find_by(tracking_code: params[:tracking_code])
    render json: { error: 'Tracking link not found' }, status: :not_found unless @link
  end

  def link_params
    params.require(:link).permit(:store_url)
  end
end
