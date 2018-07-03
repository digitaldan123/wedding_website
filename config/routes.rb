Rails.application.routes.draw do
  #importer app
  get 'importer/index'
  post 'importer/upload_csv_file', to: 'importer#upload_csv_file', as: 'upload_csv_file'

  #emailer app
  #get 'email', to: 'email#index', as: 'email'
  #post '/send_email', to: 'email#send_email', as: 'send_email'
  get 'email_rsvp', to: 'email#email_rsvp', as: 'email_rsvp'
  post '/send_rsvp_email', to: 'email#send_rsvp_email', as: 'send_rsvp_email'
  get 'update_guests', to: 'email#update_guests', as: 'update_guests'
  get 'update_guest_form', to: 'email#update_guest_form', as: 'update_form'

  #guests rsvp app
  get 'guests/logout', to: 'guests#logout', as: 'guest_logout'
  get 'guests/guest_grab_info', to: 'guests#guest_grab_info', as: 'guest_grab_info'
  get 'guests/new', to: 'guests#new', as: 'guest_new'
  post 'guests', to: 'guests#create', as: 'guest_create'
  get 'guests/:auth_token', to: 'guests#edit', as: 'guest_from_token'
  get 'guests/:auth_token/view_invitation', to: 'guests#view_invitation'
  post 'guests/update', to: 'guests#update', as: 'guest_update'
  get 'guests', to: 'guests#index', as: 'guests'

  #admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #homepage
  root 'welcome#index', as: 'home'

end
