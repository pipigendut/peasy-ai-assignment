require 'sidekiq'

class UserCaptureJob
  include Sidekiq::Job
  sidekiq_options queue: :default

  def perform
    begin
      users_data = UserApi.fetch_users_data

      users_data['results'].each do |user_data|
        begin
          User.upsert(user_attributes(user_data))
        rescue StandardError => e
          Rails.logger.error("UserCaptureJob::error::001::#{user_data}::#{e.message}")
        end
      end

      male_count, female_count = User.fetch_count_genders
      UserService.store_gender_counts_to_redis(male_count, female_count)
    rescue StandardError => e
      Rails.logger.error("UserCaptureJob::error::001::#{e.message}")
    end
  end

  private

  def user_attributes(data)
    {
      uuid: data['login']['uuid'],
      gender: data['gender'],
      name: data['name'],
      location: data['location'],
      age: data['dob']['age']
    }
  end
end
