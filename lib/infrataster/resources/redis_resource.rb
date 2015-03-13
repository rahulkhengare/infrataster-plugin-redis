require 'infrataster'
require 'redis'

module Infrataster
  module Resources
    class RedisResource < BaseResource
      Error = Class.new(StandardError)

      attr_reader :query
      attr_accessor :redis
       
      def initialize(query, options={})
        @query = query 
        @redis = nil
      end
    
      def to_s
        "Redis : \"#{@query}\""
      end
    end
  end
end
