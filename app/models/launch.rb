class Launch
    include ActiveModel::Model
    attr :docker_file_url, :program_name, :id
    @@launches = []

    def initialize(params={})
        return if params.empty?
        @docker_file_url = raw_url params['docker_file_url']
        @program_name = @docker_file_url.split('/')[4]
        @id = @@launches.count+1
    end

    def id
        @id
    end

    def save
        write
        build
        run
        @@launches << self
        true
    end

    def write
        File.open(path, 'w') do |f|
            f.write(contents)
        end
    end

    def contents
        Faraday.get(@docker_file_url).body
    end

    def build
        cmd = "docker build -t #{self.program_name} -f #{self.path} ."
        debug "build #{cmd}"
        Kernel.system(cmd)
    end

    def raw_url(url)
        url = url.gsub('github.com', 'raw.githubusercontent.com')
        url.gsub('blob/', '')
    end

    def run
        cmd = "docker run #{self.program_name}"
        debug "run #{cmd}"
        Kernel.system(cmd)
    end

    def debug(message)
        Rails::logger.debug(message)
    end

    def path
        "./dockers/#{simple_path}"
    end

    def simple_path
        self.docker_file_url.gsub('/', '_').gsub(':', '-')
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
