require 'test_helper'

class LaunchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @params = {'docker_file_url' =>
'https://github.com/docker-library/hello-world/blob/bdee60d7ff6b98037657dc34a10e9ca4ffd6785f/hello-world/Dockerfile'}
    @subject = Launch.new(@params)
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
      post launch_create_url, params: { launch: @params }
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
