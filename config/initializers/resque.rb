require 'resque' # include resque so we can configure it
Resque.redis = "redis_server:6379" # tell Resque where redis lives
require 'resque_scheduler'
require 'resque_scheduler/server'