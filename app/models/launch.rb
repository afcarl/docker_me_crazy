class Launch
    include ActiveModel::Model
    attr :docker_file_url, :program_name, :id
    @@launches = []
    # TODO: refactor this so that a launch runner is provided separately
    # which will have all of the .write .build .switch and .run functions
    # to allow us to switch between test and production mode
    def initialize(params={})
        return if params.empty?
        @docker_file_url = params['docker_file_url']
        @program_name = application_name
        @dockerfile_path = dockerfile_path
        @id = SecureRandom.uuid
    end

    def id
        @id
    end

    def save
        write
        build
        switch
        run
        @@launches << self
        true
    end

    def write
        cmd = "git clone #{self.application_remote_path} #{self.application_local_path}"
        debug "write #{cmd}"
        Kernel.system(cmd)
    end

    def build
        cmd = "cd #{self.application_local_path} && #{switch} &&  docker build --no-cache -t #{self.program_name}:#{id} -f #{self.dockerfile_path} ."
        debug "build #{cmd}"
        Kernel.system(cmd)
    end

    def switch
        "eval $(docker-machine env aws07)"
    end

    def run
        #TODO: oh what the heck. But also clean this up to have better port assignment
        port = 3000 + Random.rand(1000)
        cmd = "#{switch} && docker run -p #{port}:3000 #{self.program_name}:#{id}"
        debug "run #{cmd}"
        Kernel.system(cmd)
    end


    # private
    def raw_url(url)
        url = url.gsub('github.com', 'raw.githubusercontent.com')
        url.gsub('blob/', '')
    end

    def application_remote_path
        urls = @docker_file_url.split('/')
        urls[0..4].join('/')
    end

    def application_local_path
        "./launches/#{application_name}"
    end

    def application_files
        Dir.entries(application_local_path)
    end

    def application_name
        @docker_file_url.split('/')[4]
    end

    def dockerfile_path
        "Dockerfile-rails"
    end

    def simple_path
        self.docker_file_url.gsub('/', '_').gsub(':', '-')
    end

    def debug(message)
        Rails::logger.debug(message)
    end

    def contents
        Faraday.get(@docker_file_url).body
    end


    #self

    def self.all
        @@launches
    end

    def self.count
        @@launches.count
    end

    def self.last
        @@launches.last
    end


end
