# Preview all emails at http://localhost:3000/rails/mailers/my_mailer
class MyMailerPreview < ActionMailer::Preview
  def send_rsvp_email_preview
    msg = "Dear Daniel,\n\n"
    msg += "\n\nSee you in August!\nLuCinda & Dan\n#lucindan2017"
       msg += "\n\nWe are very excited that you are coming to our wedding on August 19th!"
       msg += " Thank you for your RSVP.  Here's a reminder for what you chose :"
       msg += "\n\n"
       msg += "\n\tFriday river/lake cruise (6:45pm, food and drink provided) : Yes"
       msg += "\n\tWedding and Ceremony (arrive by 4:45pm) : Yes"
       msg += "\n\tSunday Brunch(9:30-11:30am) : Yes"
       msg += "\n\nView the full invitation with more details here : "

    options={}
    options[:guestid] = '2'
    options[:email] = 'blah@something.com'
    options[:message] =  msg
    options[:email_type] = 'invitation'
    options[:sub] = 'test subject'
    MyMailer.send_rsvp_email(options)
  end

  def send_std_email_preview
    options={}
    options[:guestid] = '1'
    options[:email] = 'blah@something.com'
    options[:message] = 'test email message'
    options[:email_type] = 'save_the_date'
    options[:sub] = 'test subject'
    MyMailer.send_rsvp_email(options)
  end
end
