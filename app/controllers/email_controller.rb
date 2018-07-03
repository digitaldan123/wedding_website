class EmailController < ApplicationController
  before_action :authenticate_admin_user!

  def email_rsvp
    @groups = Group.all
    @guests = @groups.first.guest
  end

  def index
    @groups = Group.all
  end

  def send_rsvp_email
    @guest = Guest.find(params[:guestid])
    MyMailer.send_rsvp_email(params).deliver
    notice_resp = "Email  for " + @guest.name + " sent!"
    redirect_to email_rsvp_url, notice: notice_resp
  end

  def update_guests
    @guests = Group.find(params[:id]).guest
    respond_to do |format|
      format.js
    end
  end

  def update_guest_form
    @guest = Guest.find(params[:id])
    @group = Group.find(@guest.group_id)
    @guests = Guest.where(group_id: @guest.group_id)
    respond_to do |format|
      format.js
    end
  end

end
