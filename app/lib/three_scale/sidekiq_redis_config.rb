# frozen_string_literal: true

module ThreeScale
  class SidekiqRedisConfig < RedisConfig
    def initialize(redis_config = {})
      redis_config.delete(:namespace)
      super redis_config
    end
  end
end
