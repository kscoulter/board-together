class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances
  def sort_dates
    @today = []
    @tomorrow = []
    @future = []
    Events.all.each do |e|
      if e.time.today?
        @today.push[e]
      elsif e.time.to_date == Date.tomorrow.to_date
        @tomorrow.push[e]
      elsif e.time.future?
        @future.push[e]
      end
  end
end
