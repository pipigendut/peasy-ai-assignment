class User < ApplicationRecord
  validates :uuid, presence: true
  validates :gender, inclusion: { in: %w[male female] }
  validates :age, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_destroy :update_daily_record

  def full_name
    "#{name['title']}. #{name['first']} #{name['last']}"
  end

  class << self
    def fetch_gender_avg_ages
      gender_avg_ages = group(:gender).average(:age)
      [gender_avg_ages['male'].to_i, gender_avg_ages['female'].to_i]
    end

    def fetch_count_genders
      gender_count = group(:gender).count
      [gender_count['male'] || 0, gender_count['female'] || 0]
    end

    def upsert(attributes)
      user = find_or_initialize_by(uuid: attributes[:uuid])
      user.update!(attributes)
    end
  end

  private

  def update_daily_record
    DailyRecordUpdateJob.perform_async
  end
end
