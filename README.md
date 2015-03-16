# infrataster-plugin-redis
Plugin to test and query redis server using infrataster

Redis plugin for [Infrataster](https://github.com/rahulkhengare/infrataster-plugin-redis)

## Installation

Add this line to your Gemfile:

    gem 'infrataster-plugin-redis'

And then add the following line to your spec\_helper.rb:

    require 'infrataster-plugin-redis'

## Usage

```ruby
describe server(:redisdb) do
  describe redis("ping") do
    it 'should ping server' do
      # Ping redis
      result.should == "PONG"
    end
  end

  describe redis("set 'status', 'success'") do
    it 'should set value' do
      # Setting value in redis
      result.should == "OK"
    end
  end

  describe redis("get 'status'") do
    it 'should get value' do
      # Getting value from redis
      result.should == 'success'
    end
  end
end
```

You can specify hostname, port number, db by options passed to `Infrataster::Server.define`:

```ruby
Infrataster::Server.define(
  # ... 
  redis: {host: 'localhost', port: 6379, db: 15},
)
```

You can access password protected redis instance by specifying password in options passed to `Infrataster::Server.define`:

```ruby
Infrataster::Server.define(
  # ... 
  redis: {host: 'localhost', port: 6379, db: 15, password: 'p4ssw0rd'}
)
```

You can also access the redis using URL Functionality 

```ruby
Infrataster::Server.define(
  # ... 
  redis:{url: 'redis://localhost:6379/15'}
  #redis:{url: 'redis://:p4ssw0rd@localhost:6379/15'}
)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/infrataster-plugin-redis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

