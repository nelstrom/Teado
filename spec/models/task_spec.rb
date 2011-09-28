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

  ['asap', '', nil].each do |value|
    it "sets the due date to nil when the 'bucket' text is #{value}" do
      task = Factory(:task, :bucket => value)
      task.errors.should be_empty
      task.bucket.should == "asap"
      task.due_at.should == nil
    end
  end

  it "updates the due date when assigned to a new 'bucket'" do
    task = Factory(:task, :due_at => Time.now.midnight.tomorrow, :bucket => "due_tomorrow")
    task.update_attributes( { :bucket => "due_this_week" } )
    task.errors.should be_empty
    task.bucket.should == "due_this_week"
    task.due_at.should == Time.zone.now.end_of_week
  end

  describe "as_json" do
    it "includes the virtual 'bucket' attribute" do
      json = Factory(:task).as_json
      json.keys.should include(:bucket)
      json[:bucket].should == 'asap'
    end

    it "includes any associated tags" do
      task = Factory(:task)
      tag = Factory(:tag)
      task.tags << tag

      json = task.as_json
      json.keys.should include(:tags)
      json[:tags].size.should == 1
      json[:tags].first.should == tag.as_json
    end
  end

end
