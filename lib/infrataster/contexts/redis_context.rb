require 'infrataster'
require 'redis'

module Infrataster
  module Contexts
    class RedisContext < BaseContext
      def result 
        options = {host: 'localhost', port: 6379, db: 15}
        if server.options[:redis]
          options = options.merge(server.options[:redis])
        end

        # Query  parse 
        query, arguments = resource.query.split(' ', 2) 
        # For set and get query parse and get arguments
        if query == "set" or query == "get"
          arguments = arguments.scan(/'[^']*'/).map{|n| eval n}  
        end 

        # Initialize the redis obj
        resource.redis = Redis.new(:host=>"#{options[:host]}", :port=>"#{options[:port]}", :db=>"#{options[:db]}")
        if resource.redis.respond_to?(query)
          # Run query 
          resource.redis.method(query).call(*arguments)
        end  
      end
    end
  end
end 
