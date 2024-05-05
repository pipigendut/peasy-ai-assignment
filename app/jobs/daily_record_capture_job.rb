require 'sidekiq'

class DailyRecordCaptureJob
  include Sidekiq::Job
  sidekiq_options queue: :default

  def perform(date = Date.today)
    begin
      male_count, female_count = UserService.fetch_gender_counts_from_redis
      male_avg_age, female_avg_age = User.fetch_gender_avg_ages

      daily_record_attributes = {
        male_count:,
        female_count:,
        male_avg_age:,
        female_avg_age:
      }
      DailyRecord.upsert(daily_record_attributes, date)
    rescue StandardError => e
      Rails.logger.error("DailyRecordCaptureJob::error::001::#{e.message}")
    end
  end
end
