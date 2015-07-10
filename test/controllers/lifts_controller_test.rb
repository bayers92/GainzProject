require 'test_helper'

class LiftsControllerTest < ActionController::TestCase
  setup do
    @lift = lifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lift" do
    assert_difference('Lift.count') do
      post :create, lift: { description: @lift.description, rep_count: @lift.rep_count, type: @lift.type, workout_id: @lift.workout_id }
    end

    assert_redirected_to lift_path(assigns(:lift))
  end

  test "should show lift" do
    get :show, id: @lift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lift
    assert_response :success
  end

  test "should update lift" do
    patch :update, id: @lift, lift: { description: @lift.description, rep_count: @lift.rep_count, type: @lift.type, workout_id: @lift.workout_id }
    assert_redirected_to lift_path(assigns(:lift))
  end

  test "should destroy lift" do
    assert_difference('Lift.count', -1) do
      delete :destroy, id: @lift
    end

    assert_redirected_to lifts_path
  end
end
