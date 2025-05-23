class InquiriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inquiries = Inquiry.joins(:gallery).where(galleries: { user: current_user })
    @inquiries.update_all(read: true)
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
    if @inquiry.gallery.user == current_user
      @inquiry.destroy
      redirect_to messages_path
    else
      redirect_to root_path, alert: "You’re not authorized to delete this inquiry."
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
