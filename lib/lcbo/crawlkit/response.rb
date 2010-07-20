module LCBO
  module CrawlKit
    class Response

      attr_reader :response, :body, :query_params, :body_params, :uri, :code

      def initialize(response, query_params, body_params)
        @response     = response
        @code         = response.code
        @uri          = response.requested_url
        @http_method  = response.requested_http_method
        @body         = response.body.gsub("\r\n", "\n")
        @query_params = query_params
        @body_params  = body_params
        ensure_success!
      end

      protected

      def ensure_success!
        return if @code == 200
        raise RequestFailedError, "<#{@uri}> failed with status: #{@code}"
      end

    end
  end
end