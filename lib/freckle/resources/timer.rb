module Freckle
  module Resources
    class Timer
      attr_reader :id,
                  :state,
                  :seconds,
                  :formatted_time,
                  :date,
                  :description,
                  :project,
                  :url,
                  :start_url,
                  :pause_url,
                  :log_url

      def initialize(attrs)
        @id             = attrs['id']
        @state          = attrs['state']
        @seconds        = attrs['seconds']
        @formatted_time = attrs['formatted_time']
        @date           = attrs['date']
        @description    = attrs['description']
        @project        = Project.new(attrs['project'])
        @url            = attrs['url']
        @start_url      = attrs['start_url']
        @pause_url      = attrs['pause_url']
        @log_url        = attrs['log_url']
      end
    end
  end
end
