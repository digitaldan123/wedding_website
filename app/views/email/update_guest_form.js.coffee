$("#email").val("<%= escape_javascript(@guest.email) %>")
<% url_path = ENV['SITE_URL'] + "/guests/" + @guest.auth_token %>
if $('#email_choice_invitation').is(':checked')
    <% if @guest.attending == 'yes' %>
    $("#message").val("Dear <%= j(@guest.name) %>,\n\nWe are very excited that you are coming to our wedding on August 19th! Thank you for your RSVP. Below is the invitation with details.\n\nClick here for more information and your personalized RSVP page <%= j(url_path) %>\n\nSee you in August!\nLuCinda & Dan\n#lucindan2017")
    <% elsif @guest.attending == 'no' %>
    $("#message").val("Dear <%= j(@guest.name) %>,\n\nWe are sorry that you won't be able to make it to our wedding this summer. Thank you for your RSVP. Even though you won't be attending, we want to share our formal invitation with you.\n\nClick here for more information and your personalized RSVP page <%= j(url_path) %>\n\nLuCinda & Dan\n#lucindan2017")
    <% else %>
    $("#message").val("Dear <%= j(@guest.name) %>,\n\nWe are very excited to formally invite you to our wedding on August 19th in Chicago! Below is the invitation with details. Kindly RSVP by July 29th.\n\nClick here for more information and your personalized RSVP page <%= j(url_path) %>\n\nHope to see you in August!\nLuCinda & Dan\n#lucindan2017")
    <% end %>
    $("#sub").val("Wedding Invitation: LuCinda & Dan August 19, 2017")
    $("#email_type").val("invitation")
else if $('#email_choice_save_the_date').is(':checked')
    $("#message").val("Dear <%= j(@guest.name) %>,\n\nWe are excited to invite you to our wedding on August 19th, 2017.  Please save the date!\n\nClick here for more information and your personalized RSVP page <%= j(url_path) %>\n\nLuCinda & Dan")
    $("#sub").val("Save the Date: LuCinda & Dan's 8-19-2017 Wedding!!")
    $("#email_type").val("save_the_date")
else
    <%
    msg = "Dear "
    @guests.each do |guest|
       if guest.equal?(@guests.last) and not guest.equal?(@guests.first)
          msg += " and "
       elsif not guest.equal?(@guests.first)
          msg += ", "
       end
       msg += guest.name
    end
    msg += ","
    if @guest.attending == 'yes'
       food_options=['Chicken and Red Snapper Fish Duet',
                     'Slow Roasted Amish Chicken Breast',
                     'Pan Roasted Red Snapper Fish',
                     'Vegetarian Japanese Panko Risotto Cake',
                     'Childrens Menu']
       msg += "\n\nWe are very excited that you are coming to our wedding on August 19th!"
       msg += " Thank you for your RSVP.  Here's a reminder for what you chose :"
       msg += "\n"
       if @group.day_before_invite
           msg += "\n\tFriday river/lake cruise (6:45pm, food and drink provided) : " + @guest.day_before.capitalize
       end
       msg += "\n\tWedding and Ceremony (arrive by 4:45pm) : " + @guest.attending.capitalize
       @guests.each do |guest|
           if guest.attending == 'yes'
               msg += "\n\t" + guest.name + "'s food selection : " + food_options[guest.food]
           end
       end
       if @group.day_after_invite
           msg += "\n\tSunday Brunch(9:30-11:30am) : " + @guest.day_after.capitalize
       end
       msg += "\n\nView the full invitation with more details here : " + url_path+"/view_invitation"
       msg += "\n\nUpdated parking, shuttle service, and babysitting info here : ENV['SITE_URL']#accommodations"
    elsif @guest.attending == 'no'
       msg += "\n\nWe are sorry that you won't be able to make it to our wedding this summer."
       msg += "Thank you for your RSVP. Even though you won't be attending, we are still thinking of you!"
    else
       msg += "\n\nWe hope you are able to make it to our wedding on August 19th, 2017.\n\nPlease RSVP here : " + url_path
       msg += " and let us know if you can attend.\n\nView the full invitation here : " + url_path+"/view_invitation"
    end
    msg += "\n\nSee you in a few weeks!\nLuCinda & Dan\n#lucindan2017"
    %>
    $("#message").val("<%= j(msg.html_safe) %>")
    $("#sub").val("Reminder: LuCinda & Dan's 8-19-2017 Wedding!!")
    $("#email_type").val("reminder")

$("#save_the_date_status").empty().append("<%= @guest.rsvp_sent ? 'Yes' : 'No' %>")
$("#invitation_status").empty().append("<%= @guest.invitation_sent ? 'Yes' : 'No' %>")
$("#reminder_status").empty().append("<%= @guest.reminder_sent ? 'Yes' : 'No' %>")
$("#attending").empty().append("<%= @guest.attending.capitalize %>")
$("#day_before").empty().append("<%= @guest.day_before.capitalize %>")
$("#day_after").empty().append("<%= @guest.day_after.capitalize %>")
$("#view_rsvp_link").empty().append('<a href="<%= url_path %>">rsvp link</a>')
$("#view_invitation_link").empty().append('<a href="<%= url_path+'/view_invitation' %>">invite link</a>')
$("#guestid").val("<%= @guest.id %>")
