class Task < ActiveRecord::Base

  has_and_belongs_to_many :tags
  belongs_to :user, :foreign_key => "assigned_to"

  def completed?
    !!self.completed_at
  end

  def as_json(options={})
    defaults = {
      :methods => [:bucket, :done_at],
      :include => :tags
    }
    super(defaults.merge(options))
  end

  def done_at
    completed_at.to_i
  end

  def bucket=(time)
    time = "asap" if time.blank?
    self.due_at = case time
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

  def bucket
    return "asap" if self.due_at.blank?
    case
    when self.due_at < Time.zone.now.midnight
      "overdue"
    when self.due_at >= Time.zone.now.midnight && self.due_at < Time.zone.now.midnight.tomorrow
      "due_today"
    when self.due_at >= Time.zone.now.midnight.tomorrow && self.due_at < Time.zone.now.midnight.tomorrow + 1.day
      "due_tomorrow"
    when self.due_at >= (Time.zone.now.midnight.tomorrow + 1.day) && self.due_at < Time.zone.now.next_week
      "due_this_week"
    when self.due_at >= Time.zone.now.next_week && self.due_at < (Time.zone.now.next_week.end_of_week + 1.day)
      "due_next_week"
    else
      "due_later"
    end
  end

end
