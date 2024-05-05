require 'redis'

class CacheManager
  def self.set(key, value)
    $redis.set(key, value)
  end

  def self.get(key)
    $redis.get(key)
  end
end
