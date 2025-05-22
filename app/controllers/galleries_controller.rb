class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to @gallery, notice: "Gallery created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:artist, :description, :date, :image)
  end
end
