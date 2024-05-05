class UserApi
  include HTTParty

  base_uri 'https://randomuser.me/api/'

  def self.fetch_users_data
    begin
      response = get('/?results=20')

      return JSON.parse(response.body) if response.code == 200

      raise StandardError, "Failed to fetch user data. HTTP status: #{response}"
    rescue StandardError => e
      Rails.logger.error("UserApiService::fetch_users_data::error::001::#{e.message}")
      nil
    end
  end
end
