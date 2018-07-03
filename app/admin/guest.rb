ActiveAdmin.register Guest do

index do
  selectable_column
  excluded = ["address", "auth_token", "created_at", "is_under_twelve", "city", "state", "zip"]
  (Guest.column_names - excluded).each do |c|
    column c.to_sym
  end
  actions
end



# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :email, :day_before, :day_after, :food, :dietary_restrictions, :address, :auth_token, :group_id, :attending, :last_name, :viewed_rsvp, :street, :city, :state, :zip, :rsvp_sent, :is_under_twelve, :invitation_sent, :reminder_sent
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
