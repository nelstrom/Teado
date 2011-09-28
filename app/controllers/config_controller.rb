class ConfigController < ApplicationController
  def index
    render :json => { :taskbuckets => TaskBucket.all.as_json }
  end
end
