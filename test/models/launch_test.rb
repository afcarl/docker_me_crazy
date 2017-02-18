require 'test_helper'

class LaunchTest < ActiveSupport::TestCase

    # TODO: separate these into two separate tests
    test 'initialize and get program name' do
        url = 'https://github.com/dmitrinesterenko/blog/blob/master/Dockerfile-production'
        raw_url = 'https://raw.githubusercontent.com/dmitrinesterenko/blog/master/Dockerfile-production'
        launch = Launch.new(url)
        assert_equal(launch.docker_file_url, raw_url)
        assert_equal(launch.program_name, 'blog')
    end
end
