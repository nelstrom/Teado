class Task < ActiveRecord::Base

  has_and_belongs_to_many :tags
  belongs_to :user

  before_create :set_due_date
  before_update :set_due_date, :unless => :completed?

  def completed?
    !!self.completed_at
  end
  
  private

  def set_due_date
    self.bucket = "asap" if self.bucket.blank?
    self.due_at = case self.bucket
    when "overdue"
      self.due_at || Time.zone.now.midnight.yesterday
    when "due_today"
      Time.zone.now.midnight
    when "due_tomorrow"
      Time.zone.now.midnight.tomorrow
    when "due_this_week"
      Time.zone.now.end_of_week
    when "due_next_week"
      Time.zone.now.next_week.end_of_week
    when "due_later"
      Time.zone.now.midnight + 100.years
    else # due_asap
      nil
    end
  end
  
end
