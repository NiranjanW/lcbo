module LCBO
  module CrawlKit
    module Page

      def self.included(mod)
        mod.send(:include, Eventable)
        mod.send(:attr_reader, :html, :query, :params, :response)
        mod.instance_variable_set(:@request_prototype, RequestPrototype.new)
        mod.instance_variable_set(:@fields, [])
        mod.extend(ClassMethods)
      end

      module ClassMethods
        def uri(value = nil)
          if value
            @request_prototype.uri_template = value
          else
            @request_prototype.uri_template
          end
        end

        def default_params(value = nil)
          if value
            @request_prototype.params = value
          else
            @request_prototype.params
          end
        end

        def http_method(value = nil)
          if value
            @request_prototype.http_method = value
          else
            @request_prototype.http_method
          end
        end

        def emits(field, &block)
          @fields << field.to_sym
          define_method(field, &block) if block_given?
        end

        def request(query = {}, params = {}, html = nil)
          new(query, params, html).process
        end

        def fields
          @fields
        end

        def request_prototype
          @request_prototype
        end
      end

      def initialize(query = {}, params = {}, html = nil)
        @query  = query
        @params = params
        @html   = html
        parse!
      end

      def request_prototype
        self.class.request_prototype
      end

      def fields
        self.class.fields
      end

      def http_method
        self.class.http_method
      end

      def process
        request
        parse
      end

      def request
        return if @html
        fire :before_request
        @response = request_prototype.request(args, params).run
        @html     = @response.body
        fire :after_request
        self
      end

      def parse
        return unless @html
        return if @doc
        fire :before_parse
        @doc = Nokogiri::HTML(@html)
        fire :after_parse
        self
      end

      def as_hash
        fields.reduce({}) { |hsh, field| hsh.merge(field => send(field)) }
      end

      protected

      def doc
        @doc
      end

    end
  end
end
