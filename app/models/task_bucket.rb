class TaskBucket
  def self.all
    [
      { :text => 'As soon as possible',  :value => 'asap' },
      { :text => 'Today',                :value => 'due_today' },
      { :text => 'Tomorrow',             :value => 'due_tomorrow' },
      { :text => 'This week',            :value => 'due_this_week' },
      { :text => 'Next week',            :value => 'due_next_week' },
      { :text => 'Sometime later',       :value => 'due_later' },
      { :text => 'Overdue',              :value => 'overdue' },
    ]
  end
end
