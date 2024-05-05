class UserService
  MALE_COUNT_KEY = 'male_count'.freeze
  FEMALE_COUNT_KEY = 'female_count'.freeze

  def self.store_gender_counts_to_redis(male_count, female_count)
    CacheManager.set(MALE_COUNT_KEY, male_count)
    CacheManager.set(FEMALE_COUNT_KEY, female_count)
  end

  def self.fetch_gender_counts_from_redis
    [CacheManager.get(MALE_COUNT_KEY), CacheManager.get(FEMALE_COUNT_KEY)]
  end
end
