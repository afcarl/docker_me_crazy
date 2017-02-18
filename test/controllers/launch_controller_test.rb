require 'test_helper'

class LaunchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docker_file_url = 'https://github.com/dmitrinesterenko/blog/blob/master/Dockerfile-production'
    @subject = Launch.new(@docker_file_url)
  end

  test "should get index" do
    get launch_index_url
    assert_response :success
  end

  test "should get new" do
    get new_launch_url
    assert_response :success
  end

  test "should create launch" do
    assert_difference('Launch.count') do
      post launch_create_url, params: { launch: @docker_file_url }
    end
    #assert_redirected_to launch_url([:launch => Launch.last])
  end

  #test "should show launch" do
  #  get show_launch_url(@launch)
  #  assert_response :success
  #end

  #TODO: these are future needs
  #test "should get edit" do
  #  get edit_launch_url(@launch)
  #  assert_response :success
  #end

  #test "should update launch" do
  #  patch launch_url(@launch), params: { launch: {  } }
  #  assert_redirected_to launch_url(@launch)
  #end

  #test "should destroy launch" do
  #  assert_difference('Launch.count', -1) do
  #    delete launch_url(@launch)
  #  end

  #  assert_redirected_to launch_index_url
  #end
end
