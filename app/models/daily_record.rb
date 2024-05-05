class DailyRecord < ApplicationRecord
  validates :date, presence: true
  validates :male_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :female_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :male_avg_age, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :female_avg_age, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_save :calculate_avg_ages, if: -> { saved_change_to_male_count? || saved_change_to_female_count? }

  class << self
    def upsert(attributes, date)
      daily_record = find_or_initialize_by(date:)
      daily_record.update!(attributes)
    end
  end

  private

  def calculate_avg_ages
    male_avg_age, female_avg_age = User.fetch_gender_avg_ages
    self.male_avg_age = male_avg_age
    self.female_avg_age = female_avg_age
    save
  end
end
