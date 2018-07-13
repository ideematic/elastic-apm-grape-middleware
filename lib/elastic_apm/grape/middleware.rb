# frozen_string_literal: true
# Source: https://github.com/elastic/apm-agent-ruby/blob/master/lib/elastic_apm/middleware.rb
require 'grape'

module ElasticAPM
  module Grape
    class Middleware < ::Grape::Middleware::Base
      def call(env)
        resp = nil
        route_name = env['api.endpoint']&.routes&.first&.pattern&.origin || env['REQUEST_PATH']
        span_name = [env['REQUEST_METHOD'], route_name].join(' ')

        ElasticAPM.span span_name, 'app.api.request', context: ElasticAPM.build_context(env), include_stacktrace: false do
          resp = @app.call env
        end
        resp
      end
    end
  end
end