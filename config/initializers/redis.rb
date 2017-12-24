# 20171222 6.12: Redis & Performance Strategy
if Rails.env.production?
	$redis = Redis.new(url: ENV["REDIS_URL"])
else
	$redis = Redis.new(host: 'localhost', port: 6379)
end