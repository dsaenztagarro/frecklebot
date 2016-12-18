require 'net/http'
require 'openssl'

module Freckle
  class Client
    API_ENDPOINT = 'https://api.letsfreckle.com'

    def initialize(freckle_token)
      @freckle_token = freckle_token
      # Init HTTPS client
      uri = URI.parse(API_ENDPOINT)
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    def get_projects
      get('/v2/projects')
    end

    def start_projects_timer(project_id, attrs)
      put("/v2/projects/#{project_id}/timer/start", attrs)
    end

    def get_tags
      get('/v2/tags')
    end

    def post_tags(attrs)
      res = post('/v2/tags', attrs)
      # TODO: raise_error(res) unless status_201_created?(res)
    end

    def get_timers
      get('/v2/timers')
    end

    def post_timers(attrs)
      post('/v2/timers', attrs)
    end

    private

    attr_reader :http, :freckle_token

    def get(path)
      send(Net::HTTP::Get.new(path))
    end

    def post(path, attrs)
      request = Net::HTTP::Post.new(path)
      send_content(request, attrs)
    end

    def put(path, attrs)
      request = Net::HTTP::Put.new(path)
      send_content(request, attrs)
    end

    def send_content(req, attrs)
      req.body = attrs.to_json
      http.request(set_headers_with_content(req))
    end

    def send(req)
      http.request(set_headers(req))
    end

    def set_headers_with_content(req)
      set_headers(req)
      req['Content-Type'] = 'application/json'
      req
    end

    def set_headers(req)
      req['User-Agent']     = 'FreckleBot/1.0'
      req['X-FreckleToken'] = freckle_token
      req
    end
  end
end
