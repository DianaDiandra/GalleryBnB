class InquiriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inquiries = current_user.received_inquiries.includes(:gallery)
  end
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @inquiry = @gallery.inquiries.new(inquiry_params)
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
