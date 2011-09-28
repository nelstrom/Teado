require 'spec_helper'

describe Task do
  describe "create" do
    it "should create a new task instance given valid attributes" do
      task = Factory(:task)
      task.should be_valid
      task.errors.should be_empty
    end
  end
end
