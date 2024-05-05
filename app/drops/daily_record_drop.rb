class DailyRecordDrop < Liquid::Drop
  def initialize(daily_record)
    @daily_record = daily_record
  end

  def date
    @daily_record.date
  end

  def male_count
    @daily_record.male_count
  end

  def female_count
    @daily_record.female_count
  end

  def male_avg_age
    @daily_record.male_avg_age
  end

  def female_avg_age
    @daily_record.female_avg_age
  end
end
