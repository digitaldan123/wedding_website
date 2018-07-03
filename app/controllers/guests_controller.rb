class GuestsController < InheritedResources::Base

  def index
    if session[:group_id]
      @guest = Group.find(session[:group_id]).guest.first
      redirect_to guest_from_token_path @guest.auth_token
    end
  end

  def new
    if session[:group_id] or user_not_found
      @group = Group.find(session[:group_id])
      @guest = Guest.new
      @guest.group_id = session[:group_id]
    end
  end

  def create
    if session[:group_id] or user_not_found
      @guest = Guest.new(guest_params)
      @guest.group_id = session[:group_id]
      if @guest.save
        @group = Group.find(@guest.group_id)
        @group.num_of_guests_allowed -= 1
        @group.save
        redirect_to guest_from_token_path(auth_token: @guest.auth_token), notice: "Added new guest!"
      else
        flash[:notice] = "Unable to add guest."
      end
    end
  end

  def edit
    @guest = Guest.where(auth_token: params[:auth_token]).first or user_not_found
    @guest.viewed_rsvp = true
    @guest.save
    @guests = Guest.where(group_id: @guest.group_id)
    @group = Group.find(@guest.group_id)
    session[:group_id] = @group.id
  end

  def view_invitation
    @guest = Guest.where(auth_token: params[:auth_token]).first or user_not_found
    @group = Group.find(@guest.group_id)
    session[:group_id] = @group.id
  end

  def guest_grab_info
    if session[:group_id]
      @group = Group.find(session[:group_id])
      @guest = Guest.find(params[:id]) or user_not_found
      if @group.id == @guest.group_id
        respond_to do |format|
          format.js
        end
      end
    end
  end

  def update
    if session[:group_id] or user_not_found
      @group = Group.find(session[:group_id])
      @guest = Guest.find(params[:id]) or user_not_found
      if @group.id == @guest.group_id or user_not_found
        @guest.update(guest_params)
        @guests = Guest.where(group_id: @guest.group_id)
        #@group = Group.find(@guest.group_id)  #todo why do i need this???
        redirect_to guest_from_token_path(auth_token: @guest.auth_token), notice: @guest.name + " updated!"
      end
    end
  end

  def logout
    reset_session
    redirect_to guests_path
  end

  private
    def guest_params
      params.require(:guest).permit(:name, :last_name, :email, :day_before, :day_after, :food, 
                                    :dietary_restrictions, :attending, :street, :city, :state, :zip,
                                    :is_under_twelve)
    end

    def user_not_found
      raise ActionController::RoutingError.new('Guest not found')
    end
    
    def check_user_against_group
      if session[:group_id]
        @group = Group.find(session[:group_id])
        @guest = Guest.find(params[:id]) or user_not_found
        if @group.id == @guest.group_id or user_not_found
          return true
        end
      end
      false
    end
end

