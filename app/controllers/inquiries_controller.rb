class InquiriesController < ApplicationController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.gallery = @gallery
    if @inquiry.save
      redirect_to gallery_path(@gallery)
    else
      flash.now[:alert] = "Please complete all fields."
      render 'galleries/show', status: :unprocessable_entity
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to gallery_path(@inquiry.gallery)
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
