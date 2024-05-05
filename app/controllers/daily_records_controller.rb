class DailyRecordsController < ApplicationController
  def index
    @daily_records = DailyRecord.all.order(date: :desc).page(params[:page]).per(10)
    daily_records_drop = @daily_records.map { |dr| DailyRecordDrop.new(dr) }
    daily_records_table_liquid_file = File.read(Rails.root.join('app', 'templates', 'daily_records', 'table.liquid'))
    start_number = (@daily_records.current_page - 1) * @daily_records.limit_value
    @daily_records_table_liquid_template = Liquid::Template.parse(daily_records_table_liquid_file).render(
      'daily_records' => daily_records_drop,
      'start_number' => start_number
    )
  end
end
