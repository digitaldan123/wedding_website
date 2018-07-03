class ImporterController < ApplicationController
  require 'csv'
  before_action :authenticate_admin_user!

  def index
  end

  def upload_csv_file
    CSV.foreach(params[:file].path, headers: true) do |row|
      if row["Group name"]
        if row["Group name"] == '-'
          @group.num_of_guests_allowed += 1
          @group.save
          next
        else
          @group = Group.new
          @group.name = row["Group name"]
          @group.day_before_invite = true
          @group.day_after_invite = true
          @group.num_of_guests_allowed = 0
          @group.save
        end
      end
      @guest = Guest.new
      @guest.food = 0
      @guest.name = row["First Name"]
      @guest.last_name = row["Last Name"]
      @guest.last_name = row["Last Name"]
      @guest.email = row["Email"]
      @guest.street = row["Street"]
      @guest.city = row["City"]
      @guest.state = row["State"]
      @guest.zip = row["Zip Code"]
      @guest.group_id = @group.id
      @guest.save
    end
  end
end
