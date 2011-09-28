require 'spec_helper'

describe Task do

  it "creates a new task given valid attributes" do
    task = Factory(:task)
    task.should be_valid
    task.errors.should be_empty
  end

  it "calculates the due date from the 'bucket' text" do
    task = Factory(:task, :bucket => "due_this_week")
    task.errors.should be_empty
    task.bucket.should == "due_this_week"
    task.due_at.should == Time.zone.now.end_of_week
  end

  it "updates the due date when assigned to a new 'bucket'" do
    task = Factory(:task, :due_at => Time.now.midnight.tomorrow, :bucket => "due_tomorrow")
    task.update_attributes( { :bucket => "due_this_week" } )
    task.errors.should be_empty
    task.bucket.should == "due_this_week"
    task.due_at.should == Time.zone.now.end_of_week
  end

end
