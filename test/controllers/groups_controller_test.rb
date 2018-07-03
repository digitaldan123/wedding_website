require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get groups_url
    assert_response :success
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post groups_url, params: { group: { day_after_invite: @group.day_after_invite, day_before_invite: @group.day_before_invite, name: @group.name, num_of_guests_allowed: @group.num_of_guests_allowed } }
    end

    assert_redirected_to group_url(Group.last)
  end

  test "should show group" do
    get group_url(@group)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  test "should update group" do
    patch group_url(@group), params: { group: { day_after_invite: @group.day_after_invite, day_before_invite: @group.day_before_invite, name: @group.name, num_of_guests_allowed: @group.num_of_guests_allowed } }
    assert_redirected_to group_url(@group)
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end

    assert_redirected_to groups_url
  end
end
