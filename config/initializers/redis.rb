if Rails.env.test?
  REDIS = MockRedis.new
else
  REDIS = Redis.new(url: 'redis://redis:6379')
end