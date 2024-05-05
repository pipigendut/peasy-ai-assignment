require 'sidekiq'

class DailyRecordUpdateJob
  include Sidekiq::Job
  sidekiq_options queue: :default

  def perform
    begin
      male_count, female_count = User.fetch_count_genders
      male_avg_age, female_avg_age = User.fetch_gender_avg_ages

      daily_record_attributes = {
        male_count:,
        female_count:,
        male_avg_age:,
        female_avg_age:
      }

      DailyRecord.upsert(daily_record_attributes, Date.today)
      UserService.store_gender_counts_to_redis(male_count, female_count)
    rescue StandardError => e
      Rails.logger.error("DailyRecordUpdateJob::error::001::#{e.message}")
    end
  end
end
