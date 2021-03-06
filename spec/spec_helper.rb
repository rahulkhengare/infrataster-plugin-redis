require 'infrataster/rspec'
require 'infrataster-plugin-redis'

Infrataster::Server.define(
  :redisdb,
  '172.26.126.0/32',
  #redis:{host: 'localhost', port: 6379, db: 15},
  #redis:{host: 'localhost', port: 6379, db: 15, password: 'p4ssw0rd'},
  #redis:{url: 'redis://localhost:6379/15'}
  redis:{url: 'redis://:p4ssw0rd@localhost:6379/15'}
)

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  # --seed 1234
  config.order = 'random'
end
