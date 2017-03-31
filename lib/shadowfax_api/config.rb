require 'erb'
require 'yaml'
module ShadowfaxApi
  module Configuration
    def self.config
      @config ||= Config.config
    end

    class Config
      def self.load(file_name,env: :development)
        @@default_environment = env
        @@configurations      = read_configurations(file_name)
        config
      end

      def self.default_environment
        @@default_environment ||= (ENV['RACK_ENV'] || ENV['RAILS_ENV'] || :development).to_sym
      end


      def self.config
        (@@configurations      ||= read_configurations)[default_environment]
      end

      private
      def self.read_configurations(file_name = "config/shadowfax.yml")
        erb = ERB.new(File.read(file_name))
        erb.filename = file_name
        YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(erb.result) : YAML.load(erb.result)
      end
    end
  end
end