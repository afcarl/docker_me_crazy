require 'test_helper'

class LaunchTest < ActiveSupport::TestCase

    setup do
         url = 'https://github.com/docker-library/hello-world/blob/bdee60d7ff6b98037657dc34a10e9ca4ffd6785f/hello-world/Dockerfile'
         params = {'docker_file_url' => url}
        @launch = Launch.new(params)
    end
    test 'gets the raw url' do
        expected_url =
'https://raw.githubusercontent.com/docker-library/hello-world/bdee60d7ff6b98037657dc34a10e9ca4ffd6785f/hello-world/Dockerfile'
        assert_equal(@launch.docker_file_url, expected_url)
    end

    test 'parses the application name correctly from the repo' do
        assert_equal(@launch.program_name, 'hello-world')
    end
end
