class GroupsController < InheritedResources::Base

  private

    def group_params
      params.require(:group).permit(:name, :num_of_guests_allowed, :day_before_invite, :day_after_invite)
    end
end

