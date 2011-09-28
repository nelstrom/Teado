require 'spec_helper'

describe Task do

  it "should create a new task instance given valid attributes" do
    task = Factory(:task)
    task.should be_valid
    task.errors.should be_empty
  end

  it "should create a task with due date" do
    task = Factory(:task, :due_at => Time.now.end_of_week, :bucket => "due_this_week")
    task.errors.should be_empty
    task.bucket.should == "due_this_week"
    task.due_at.should == Time.zone.now.end_of_week
  end

  it "should update due date" do
    task = Factory(:task, :due_at => Time.now.midnight.tomorrow, :bucket => "due_tomorrow")
    task.update_attributes( { :bucket => "due_this_week" } )
    task.errors.should be_empty
    task.bucket.should == "due_this_week"
    task.due_at.should == Time.zone.now.end_of_week
  end

end
