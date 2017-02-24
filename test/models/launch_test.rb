require 'test_helper'

class LaunchTest < ActiveSupport::TestCase

    setup do
         url='https://github.com/dmitrinesterenko/how-we-deploy/blob/master/Dockerfile-rails'
         params = {'docker_file_url' => url}
        @launch = Launch.new(params)
    end

    test 'parses the application name correctly from the repo' do
        assert_equal(@launch.program_name, 'how-we-deploy')
    end

    test 'downloads the application' do
        @launch.save
        assert_equal(@launch.application_remote_path, 'https://github.com/dmitrinesterenko/how-we-deploy')
        assert_equal(@launch.application_local_path, './launches/how-we-deploy')
        assert_equal(@launch.application_files.count, 29)
    end
end
