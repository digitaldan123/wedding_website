class MyMailer < ApplicationMailer
  def send_rsvp_email(options={})
    @guest = Guest.find(options[:guestid])
    if options[:email_type] == "invitation"
        @guest.invitation_sent = true
    elsif options[:email_type] == "save_the_date"
        @guest.rsvp_sent = true
    elsif options[:email_type] == "reminder"
        @guest.reminder_sent = true
    end
    @guest.save
    @group = Group.find(@guest.group_id)
    @email = options[:email]
    @message = options[:message]
    @email_type = options[:email_type]
    @sub = options[:sub]
    mail(:to=>@email, :subject=>@sub)
  end
end
