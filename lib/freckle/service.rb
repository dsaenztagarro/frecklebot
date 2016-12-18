require 'json'

module Freckle
  class Service
    attr_reader :access_token

    def initialize(access_token)
      @access_token = access_token
    end

    def projects
      res = client.get_projects
      parse_collection(res) do |attrs|
        Freckle::Resources::Project.new(attrs)
      end
    end

    def tags
      res = client.get_tags
      parse_collection(res) do |attrs|
        Freckle::Resources::Tag.new(attrs)
      end
    end

    def timers
      res = client.get_timers
      parse_collection(res) do |attrs|
        Freckle::Resources::Timer.new(attrs)
      end
    end

    def create_tags(names)
      # TODO: raise error if names is not array of strings
      res = client.post_tags({ names: names })
      parse_collection(res) do |attrs|
        Freckle::Resources::Tag.new(attrs)
      end
    end

    def start_timer(project_id, description)
      client.start_projects_timer(project_id, description: description)
    end

    private

    def parse_collection(res, &block)
      JSON.parse(res.body).map(&block)
    end

    def client
      @client ||= Client.new(access_token)
    end
  end
end
