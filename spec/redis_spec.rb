require 'spec_helper'

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
