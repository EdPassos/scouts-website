require 'test_helper'

class CampNightsControllerTest < ActionController::TestCase
  setup do
    @camp_night = camp_nights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camp_nights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camp_night" do
    assert_difference('CampNight.count') do
      post :create, camp_night: { adventure_id: @camp_night.adventure_id, nights: @camp_night.nights, person_id: @camp_night.person_id }
    end

    assert_redirected_to camp_night_path(assigns(:camp_night))
  end

  test "should show camp_night" do
    get :show, id: @camp_night
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camp_night
    assert_response :success
  end

  test "should update camp_night" do
    patch :update, id: @camp_night, camp_night: { adventure_id: @camp_night.adventure_id, nights: @camp_night.nights, person_id: @camp_night.person_id }
    assert_redirected_to camp_night_path(assigns(:camp_night))
  end

  test "should destroy camp_night" do
    assert_difference('CampNight.count', -1) do
      delete :destroy, id: @camp_night
    end

    assert_redirected_to camp_nights_path
  end
end
