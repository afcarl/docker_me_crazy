module LaunchHelper

    def self.build(docker_file_url)
        Kernel.system("docker build -it ")
    end
end
