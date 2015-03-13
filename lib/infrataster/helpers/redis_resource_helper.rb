require 'rspec'
require 'infrataster/resources'

module Infrataster
  module Helpers
    module ResourceHelper
      def redis(*args)
        Resources::RedisResource.new(*args)
      end
    end
  end
end
