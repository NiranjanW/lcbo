module LCBO
  module CrawlKit
    class Request

      attr_reader :request_prototype, :query_params, :body_params

      def initialize(request_prototype, query_params = {}, body_params = {})
        @request_prototype = request_prototype
        self.query_params  = query_params
        self.body_params   = body_params
      end

      def query_params=(value)
        @query_params = value ? value : {}
      end

      def body_params=(value)
        @body_params = request_prototype.body_params.merge(value || {})
      end

      def config
        opts = {}
        opts[:method]     = request_prototype.http_method
        opts[:user_agent] = USER_AGENT
        opts[:params]     = body_params
        opts
      end

      def uri
        request_prototype.uri_template.expand(query_params).to_s
      end

      def run
        response = Typhoeus::Request.run(uri, config)
        Response.new(response, query_params, body_params)
      end

    end
  end
end
